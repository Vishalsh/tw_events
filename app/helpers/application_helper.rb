module ApplicationHelper

  def convert_array_to_string array
    array.map { |x| x.name }.join(', ')
  end

  def prevent_submission
    DateTime.now >= @event.submission_close_date
  end

  def prevent_vote?
    DateTime.now >= @event.voting_close_date
  end

  def category_options
    options_for_select([['workshop (60 min)', 'workshop (60 min)'], ['lightning (10 min)', 'lightning (10 min)']])
  end

  def admin_user(user)
    AdminUser.exists?(name: user.name)
  end
end
