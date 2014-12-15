module AdminUsersHelper

  def has_own_events
    admin_user = AdminUser.find_by(name: session[:user_name])
    return !admin_user.events.blank? if admin_user
  end

end
