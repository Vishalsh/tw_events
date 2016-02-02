class AdminUsersController < ApplicationController

  def my_events
    admin_user = AdminUser.find_by(name: session[:user_name])
    @page_name = 'My Events'
    @events = admin_user.events
  end

end
