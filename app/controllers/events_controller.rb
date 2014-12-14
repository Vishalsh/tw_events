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
    @event.admin_user = AdminUser.find_or_create_by(name: session[:user_name])
    if @event.save
      redirect_to topics_path
    else
      render template: 'events/new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes event_params
      redirect_to events_path
    else
      render template: 'events/edit'
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :submission_close_date, :voting_close_date, :description, :avatar)
  end
end
