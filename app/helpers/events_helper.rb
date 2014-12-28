module EventsHelper

  def format_date(date)
    date.strftime("%a, %b %d %Y")
  end

end