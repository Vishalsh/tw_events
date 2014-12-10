require 'rails_helper'

describe EventsController do

  before(:each) do
    session[:user_id] = 'some_user'
  end

  context '#index' do
    xit 'should get list of all the registered events' do
      event1 = Event.create(name: 'xconf', event_date: Time.parse('Thu Nov 29 00:00:00 IST 2001'), submission_close_date: Time.parse('Thu Nov 29 00:00:00 IST 2001'), voting_close_date: Time.parse('Thu Nov 31 00:00:00 IST 2001') )
      event2 = Event.create(name: 'vodqa', event_date: Time.parse('Thu Nov 29 00:00:00 IST 2001'), submission_close_date: Time.parse('Thu Dec 10 00:00:00 IST 2001'), voting_close_date: Time.parse('Thu Dec 12 00:00:00 IST 2001') )
      event3 = Event.create(name: 'ba-conf', event_date: Time.parse('Thu Nov 29 00:00:00 IST 2001'), submission_close_date: Time.parse('Thu Jan 15 00:00:00 IST 2001'), voting_close_date: Time.parse('Thu Jan 17 00:00:00 IST 2001') )
      events = [event1, event2, event3]
      get :index
      #expect(:events.length).to  eq(3)
      expect(assigns(:events)).to eq(events)
    end

    it 'should render the the index page' do
      get :index
      expect(response).to render_template('index')
    end
  end

  context '#new' do
    it 'it should render the new page' do
      get :new
      expect(response).to render_template('new')
    end

    it 'should create an empty event' do
      empty_event = Event.new
      Event.should_receive(:new).and_return empty_event
      get :new
      expect(assigns(:event)).to eq empty_event
    end
  end

  context '#create' do

    #it 'should create a new event' do
    #  before(:each) do
    #    @valid_event =
    #        {"name"=>"xconf",
    #         "event_date"=>"25/12/2014",
    #         "submission_close_date"=>"18/12/2014",
    #         "voting_close_date"=>"13/12/2014"
    #        }
    #  end
    #  post :create, params: @valid_event
    #  Event.new(name: 'xconf', event_date: Time.parse('22/11/2014'),  submission_close_date: Time.parse('Thu Nov 29 00:00:00 IST 2001'))
    #  expect(Event, :count).to_change by(1)
    #end
  end
end
