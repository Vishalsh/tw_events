module EventsHelper

  def format_date(date)
    date.strftime("%a, %b %d %Y")
  end

  def format_date_time(datetime)
    datetime.strftime('%d/%m/%Y')
  end
end