require 'rails_helper'

describe EventsController do

  before(:each) do
    session[:user_id] = 'some_user'
    session[:user_name] = 'some user'
    @valid_event_1 = create(:valid_event_1)
  end

  context '#index' do
    it 'should get list of all the registered events' do
      valid_event_2 = create(:valid_event_2)
      @events = [@valid_event_1, valid_event_2]
      get :index
      expect(assigns(:events)).to eq(@events)
    end

    it 'should render the the index page' do
      get :index
      expect(response).to render_template 'index'
    end
  end

  context '#new' do
    it 'it should render the new page' do
      get :new
      expect(response).to render_template 'new'
    end

    it 'should create an empty event' do
      empty_event = build(:valid_event_1)
      expect(Event).to receive(:new).and_return empty_event
      get :new
      expect(assigns(:event)).to eq empty_event
    end
  end

  context '#create' do
    context 'on successful save' do
      before(:each) do
        @valid_event = attributes_for(:valid_event_2)
        @valid_event[:avatar] = fixture_file_upload('/logo.png', 'image/png')
        @admin_user = create(:valid_admin_user)
      end

      it 'should redirect to events_path' do
        expect(post(:create, event: @valid_event)).to redirect_to(events_path)
      end

      it 'should increase the events count by one' do
        expect { post(:create, event: @valid_event) }.to change { Event.count }.by(1)
      end

      it 'should assign admin user for the created event' do
        post :create, event: @valid_event
        expect(controller.instance_variable_get(:@event).admin_user).to eq @admin_user
      end
    end

    context 'on failed save' do
      before(:each) do
        @invalid_event = attributes_for(:invalid_event)
        @invalid_event[:avatar] = fixture_file_upload('/logo.png', 'image/png')
      end

      it 'should render new event page' do
        expect(post(:create, event: @invalid_event)).to render_template('events/new')
      end

      it 'should not increment the event count' do
        expect { post(:create, event: @invalid_event) }.to_not change { Event.count }
      end
    end
  end

  context '#show' do

    it 'should fetch the event' do
      get :show, id: @valid_event_1.id
      expect(assigns(:event)).to eq @valid_event_1
    end

    it 'should render event modal' do
      get :show, id: @valid_event_1.id
      expect(response).to render_template 'events/shared/_event'
    end
  end

  context '#edit' do

    it 'should create an event' do
      event = build(:valid_event_1)
      expect(Event).to receive(:new).and_return event
      get :new
      expect(assigns(:event)).to eq event
    end

    it 'should render the edit page' do
      get :edit, id: @valid_event_1.id
      expect(response).to render_template 'edit'
    end
  end

  context '#update' do

    context 'on successful update' do
      before(:each) do
        @updated_event = attributes_for(:valid_event_2)
        @updated_event[:avatar] = fixture_file_upload('/logo.png', 'image/png')
      end

      it 'should update event' do
        put :update, id: @valid_event_1.id, event: @updated_event
        expect(controller.instance_variable_get(:@event)[:name]).to eq @updated_event[:name]
      end

      it 'should redirect to events_path' do
        put :update, id: @valid_event_1.id, event: @updated_event
        expect(response).to redirect_to events_path
      end
    end

    context 'on failed update' do
      before(:each) do
        @invalid_updated_event = attributes_for(:invalid_event)
        @invalid_updated_event[:avatar] = fixture_file_upload('/logo.png', 'image/png')
      end

      it 'should not update the values' do
        put :update, id: @valid_event_1.id, event: @invalid_updated_event
        expect(controller.instance_variable_get(:@event)[:name]).to eq @invalid_updated_event[:name]
      end

      it 'should render the event edit page' do
        put :update, id: @valid_event_1.id, event: @invalid_updated_event
        expect(response).to render_template 'edit'
      end
    end
  end

  context '#delete' do
    it 'should delete given event' do
      delete :destroy, id: @valid_event_1.id
      expect(Event.all).not_to eq @valid_event_1
    end

    it 'should decrease the event count by 1' do
      expect { delete(:destroy, id: @valid_event_1.id) }.to change { Event.count }.by(-1)
    end

    it 'should redirect to events_path on successful delete' do
      expect(delete(:destroy, id: @valid_event_1.id)).to redirect_to events_path
    end
  end

  context '#talks' do
    it 'should list all the talks related to the event' do
      # talk1 = create(:valid_talk)
      # talk2 = create(:valid_talk)
      # talks = [talk1, talk2]
      # @valid_event_1.talks = talks
      # get :talks, name: 'Xconf'

      # expect(controller.instance_variable_get(:@talks)).to eq talks
    end

    it 'should render talks' do
      get :talks, name: 'Xconf'

      expect(response.code).to eq '200'
    end
  end
end
