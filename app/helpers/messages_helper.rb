module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}'>#{user.name || user.email}</option>"
    end
    s.html_safe
  end
end
