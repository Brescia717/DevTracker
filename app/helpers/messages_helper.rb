module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option data-gravatar='#{gravatar_image_url(user.email)}' value='#{user.id}'>
              #{user.user_tag}
            </option>"
    end
    s.html_safe
  end
end
