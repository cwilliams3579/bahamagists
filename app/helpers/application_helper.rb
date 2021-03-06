module ApplicationHelper
  def gravatar_for(user, options = { size: 120 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.first_name, class: "img-fluid rounded-circle z-depth-2")
  end

  # def image_url(user)
  #   user.image? ? user.image : gravatar_url(user.email.downcase)
  # end
  # def images_urls(event)
  #   event.images? ? event.images : images_urls(event.images)
  # end

  def full_title(page_title = " ")
    default_title = "Bahama Gist"
    if page_title.empty?
      default_title
    else
      "#{page_title} | #{default_title}"
    end
  end

    def time_format(event_date)
    event_date.strftime("%A, %d %b %Y %l:%M %p")
  end

  def event_status(event)
    if event.end_date <= Date.today
      content_tag(:span, "", class: "past")
    else
      content_tag(:span, "", class: "upcoming")
    end
  end
end
