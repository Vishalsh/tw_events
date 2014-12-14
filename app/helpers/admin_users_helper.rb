module AdminUsersHelper

  def has_own_events
    admin_user = AdminUser.find_by(name: session[:user_name])
    if admin_user
      !admin_user.events.blank?
    end
  end

end
