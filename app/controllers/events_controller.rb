class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.save
    redirect_to events_by_age_path(event.age)
  end

  def index
    @events_by_age = Event.order(age: :desc, created_at: :desc).group_by(&:age)
  end

  def by_age
    @age = params[:age].to_i
    @events = Event.where(age: @age).order(created_at: :desc)
  end

  def edit
    @event = Event.find(params[:id])
    @age = @event.age
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to events_by_age_path(event.age)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_by_age_path(event.age)
  end

  private
  def event_params
    params.require(:event).permit(:age, :month, :event, :event_detail, :image)
  end

end
