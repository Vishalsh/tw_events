module ApplicationHelper

  def convert_array_to_string array
    array.map { |x| x.name }.join(', ')
  end

  def prevent_submission
    Time.now > Time.parse(Setting.submission_end_time)
  end

  def prevent_vote?
    Time.now > Time.parse(Setting.vote_end_time)
  end

  def category_options
    options_for_select([['workshop', 'workshop'], ['lightning', 'lightning']])
  end

  def admin_user(user)
    AdminUser.exists?(name: user.name)
  end
end
