module ApplicationHelper
  def format_date(date)
    date.strftime("%b%d%Y, %I")
  end

  def format_date_discussion(date)
    date.strftime("%B %d, %Y")
  end

# 50150083276269
  def gravatar_for(email)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, alt: email, class: "rounded-full"
  end
end
