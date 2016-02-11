module ConversationsHelper
  def mailbox_section(title, current_box, opts = {})
    opts[:class] = opts.fetch(:class, '')
    opts[:class] += ' active' if title.downcase == current_box
    count = box_count(title, @mailbox)

    content_tag :li, link_to("#{title.capitalize} (#{count})", conversations_path(box: title.downcase)), opts
  end

  def box_count(title, mailbox)
    if title.eql? 'inbox'
      mailbox.inbox.count
    elsif title.eql? 'sent'
      mailbox.sentbox.count
    elsif title.eql? 'trash'
      mailbox.trash.count
    else
      'err'
    end
  end
end
