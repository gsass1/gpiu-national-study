# NOTE(gian): used to create and deliver notifications
#
# Usage: Notifier.new.notify(recipient: current_user, actor: ...)
#
class Notifier
  def notify(options = {})
    # TODO: this is where we would deliver notifications to users in all ways possible.
    #
    # Currently only on-site notifications. Emails later.

    notification = OpenStruct.new(options.merge(created_at: DateTime.now))

    create_on_site_notification notification

    create_email_notification notification if notification.recipient.email_notifications?
  end

  private
  def create_on_site_notification(options)
    Notification.create(recipient: options.recipient, actor: options.actor, action: options.action, notifiable: options.notifiable)
  end

  def create_email_notification(options)
    NotificationsMailer.with(notification: options).notification_email.deliver_now
  end
end
