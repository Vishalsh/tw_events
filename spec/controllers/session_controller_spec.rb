require 'rails_helper'

describe SessionsController do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end

  describe '#create' do

    it 'should successfully create a user' do
      expect {
        post :create, provider: :google
      }.to change{ User.count }.by(1)
    end

    it 'should successfully create a session' do
      session[:user_id].should be_nil

      post :create, provider: :google

      expect(session[:user_id]).not_to be_nil
      expect(session[:user_name]).not_to be_nil
    end

    it 'should redirect the user to the root url' do
      post :create, provider: :google

      expect(response).to redirect_to root_url
    end

  end

  describe '#destroy' do
    before do
      post :create, provider: :google
    end

    it 'should clear the session' do
      delete :destroy

      expect(session[:user_id]).to be_nil
      expect(session[:user_name]).to be_nil
    end

    it 'should redirect to the home page' do
      delete :destroy

      expect(response).to redirect_to 'https://mail.google.com/?logout'
    end
  end

end