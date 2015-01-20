require 'rails_helper'

describe ApplicationController do

  context '#current_user' do

    it 'should set current user if the user is already present' do
      session[:user_id] = 'sachinten@cricket.com'

      user = create(:valid_user)
      @controller.current_user

      expect(controller.instance_variable_get(:@current_user)).to eq user
    end

    it 'should create new user if the user is not already present' do
      session[:user_id] = 'viratkohli@cricket.com'
      session[:user_name] = 'Virat Kohli'

      @controller.current_user

      expect(controller.instance_variable_get(:@current_user).name).to eq 'Virat Kohli'
      expect(controller.instance_variable_get(:@current_user).email).to eq 'viratkohli@cricket.com'
    end
  end

  controller do

    def index
      render template: 'events/new'
    end
  end

  it 'should return if user is signed in' do
    session[:user_id] = 'sachinten@cricket.com'
    get :index
    expect(response).to render_template 'events/new'
  end

  it 'should redirect to new session if user is not signed in' do
    get :index
    expect(response).to redirect_to '/sessions/new'
  end
end