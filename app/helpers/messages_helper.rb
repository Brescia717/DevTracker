module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option data-gravatar='#{gravatar_image_url(user.email)}' value='#{user.id}' #{'selected' if user == chosen_recipient}>
              #{user.user_tag}
            </option>"
    end
    s.html_safe
  end
end
