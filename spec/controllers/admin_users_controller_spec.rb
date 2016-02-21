require 'rails_helper'

describe AdminUsersController do

  before(:each) do
    user = create(:valid_user)
    session[:user_id] = user.id
    session[:user_name] = 'some user'
  end

  describe '#my_events' do

    before(:each) do
      @valid_admin_user = create(:valid_admin_user)
    end

    it 'should render my events page' do
      get :my_events
      expect(response).to render_template 'admin_users/my_events'
    end

    it 'should respond with 200' do
      get :my_events
      expect(response.code).to eq '200'
    end
  end

end