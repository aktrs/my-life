class EventsController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
      events_path
  end

  def new
    @event = Event.new(user: current_user)
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_by_age_path(@event.age)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    unique_ages = current_user.events.order(age: :desc).pluck(:age).uniq
    @paginated_ages = Kaminari.paginate_array(unique_ages).page(params[:page]).per(6)
  
    # ページネーションされた年齢に基づいてイベントを取得
    @events_by_age = {}
    @paginated_ages.each do |age|
      @events_by_age[age] = current_user.events.where(age: age).order(created_at: :asc)
    end
  end
  

  def by_age
    @age = params[:age].to_i
    @events = current_user.events.where(age: @age).order(created_at: :asc)
    puts @events.inspect
  end

  def edit
    @event = current_user.events.find(params[:id])
    @age = @event.age || 0
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to events_by_age_path(@event.age)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.events.find(params[:id])
    event.destroy
    redirect_to events_by_age_path(event.age)
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :age, :month, :event, :event_detail, :image)
  end

end
