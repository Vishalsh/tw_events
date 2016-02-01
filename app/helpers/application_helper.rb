module ApplicationHelper

  def convert_array_to_string array
    array.map { |x| x.name }.join(', ')
  end

  def prevent_submission?
    DateTime.now >= @event.submission_close_date
  end

  def prevent_vote?
    DateTime.now >= @event.voting_close_date
  end

  def category_options
    options_for_select([['Workshop', 'workshop'], ['Presentation', 'presentation'], ['Lightning Talk', 'lightning talk']])
  end

  def admin_user(user)
    AdminUser.exists?(name: user.name)
  end
end
