require 'rails_helper'

describe AdminUsersHelper do

  context '#has_own_events' do
    context 'when the logged in user is not an admin user' do
      it 'should return nil' do
        session[:user_name] = 'some other user'
        create(:valid_admin_user)
        expect(has_own_events).to eq nil
      end
    end
  end

  context '#has_own_events' do
    context 'when the logged in user is an admin user' do
      before(:each) do
        session[:user_name] = 'some user'
        @admin_user = create(:valid_admin_user)
      end

      it 'should return true if admin user has events' do
        event1 = create(:valid_event_1)
        event2 = create(:valid_event_2)

        @admin_user.events << event1
        @admin_user.events << event2

        # expect(has_own_events).to eq true
      end

      it 'should return false if admin user does not have events' do
        expect(has_own_events).to eq false
      end
    end
  end

end