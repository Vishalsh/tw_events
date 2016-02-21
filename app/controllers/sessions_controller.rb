require 'base64'

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to 'https://mail.google.com/?logout'
  end
end
