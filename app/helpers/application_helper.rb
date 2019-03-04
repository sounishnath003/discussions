module ApplicationHelper
  def format_date(date)
    date.strftime("%b%d%Y, %I")
  end

  def format_date_discussion(date)
    date.strftime("%B %d, %Y")
  end
end
