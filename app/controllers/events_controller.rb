class EventsController < ApplicationController

  def index
    @events = Event.all
    @page_name = 'All Events'
  end

  def new
    @new_event_active = 'active'
    @page_name = 'Register an Event'
    @event = Event.new
  end

  def create
    @event = Event.new(name: params[:event][:name],
                       event_date: DateTime.parse(params[:event][:event_date]).at_end_of_day,
                       submission_close_date: DateTime.parse(params[:event][:submission_close_date]).at_end_of_day,
                       voting_close_date: DateTime.parse(params[:event][:voting_close_date]).at_end_of_day,
                       description: params[:event][:description],
                       avatar: params[:event][:avatar])
    @event.admin_user = AdminUser.find_or_create_by(name: session[:user_name])
    if @event.save
      redirect_to events_path
    else
      render template: 'events/new'
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html { render partial: '/events/shared/event' }
    end
  end

  def edit
    @event = Event.find(params[:id])
    @page_name = 'Edit Event'
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(name: params[:event][:name],
                                event_date: DateTime.parse(params[:event][:event_date]).at_end_of_day,
                                submission_close_date: DateTime.parse(params[:event][:submission_close_date]).at_end_of_day,
                                voting_close_date: DateTime.parse(params[:event][:voting_close_date]).at_end_of_day,
                                description: params[:event][:description],
                                avatar: params[:event][:avatar])
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

  def message
    @message = Event.find(params[:id]).message
    render partial: 'events/shared/message'
  end

  def update_message
    @event = Event.find(params[:id])
    if @event.update_attribute(:message, params[:value])
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
