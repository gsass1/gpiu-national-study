# NOTE(gian): used to create and deliver notifications
#
# Usage: Notifier.new.notify(recipient: current_user, actor: ...)
#
class Notifier
  def notify(options = {})
    # TODO: this is where we would deliver notifications to users in all ways possible.
    #
    # Currently only on-site notifications. Emails later.

    create_on_site_notification OpenStruct.new(options)

    # create_email_notification(options) if options.recipient.enabled_email_notifs?
  end

  private
  def create_on_site_notification(options)
    Notification.create(recipient: options.recipient, actor: options.actor, action: options.action, notifiable: options.notifiable)
  end
end
