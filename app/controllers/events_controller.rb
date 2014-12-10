class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @new_event_active = 'active'
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to topics_path
    else
      render template: 'events/new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :event_date, :submission_close_date, :voting_close_date, :avatar)
  end
end
