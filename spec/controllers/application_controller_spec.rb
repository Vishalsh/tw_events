require 'rails_helper'

describe ApplicationController do

  # describe '#authenticate_user!' do
  #   it 'should redirect to google authentication if the user is not logged in' do
  #     session[:user_id] = nil
  #     expect(@controller.authenticate_user!).to redirect_to '/auth/google_oauth2'
  #   end
  # end

  describe '#current_user' do
    it 'should set current user if the user is already present' do
      session[:user_id] = 1

      user = create(:valid_user)
      @controller.current_user

      expect(controller.instance_variable_get(:@current_user)).to eq user
    end

    it 'should not set current user if the user id is not present' do
      session[:user_id] = nil

      @controller.current_user

      expect(controller.instance_variable_get(:@current_user)).to be_nil
    end
  end

end