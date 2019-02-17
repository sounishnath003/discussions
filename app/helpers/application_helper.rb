module ApplicationHelper
  def format_date(date)
    date.strftime("%b%d%Y, %I")
  end
end
