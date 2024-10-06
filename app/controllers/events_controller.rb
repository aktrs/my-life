class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.save
    redirect_to event_path(event.id)
  end

  def index
    @events = Event.all
    @events_by_age = Event.all.group_by(&:age)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(event.id)
  end

  private
  def event_params
    params.require(:event).permit(:age, :event, :event_detail)
  end

end
