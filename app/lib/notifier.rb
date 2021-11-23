# frozen_string_literal: true

# NOTE(gian): used to create and deliver notifications
#
# Usage: Notifier.notify(recipient: current_user, actor: ...)
#
class Notifier
  def self.notify(...)
    new.notify(...)
  end

  def self.bulk_notify(...)
    new.bulk_notify(...)
  end

  def notify(options = {})
    notification = OpenStruct.new(options.merge(created_at: DateTime.now))

    create_on_site_notification notification

    create_email_notification notification if !Rails.env.test? && notification.recipient.email_notifications?
  end

  def bulk_notify(role, options = {})
    User.with_role(role).each do |user|
      Notifier.notify(options.merge(recipient: user))
    end
  end

  private

  def create_on_site_notification(options)
    Notification.create(recipient: options.recipient, actor: options.actor, action: options.action,
                        notifiable: options.notifiable)
  end

  def create_email_notification(options)
    options_hash = {
      actor_id: options.actor.id,
      recipient_id: options.recipient.id,
      action: options.action,
      notifiable_id: options.notifiable.id,
      notifiable_class: options.notifiable.class.to_s
    }

    email = NotificationsMailer.with(notification: options_hash).notification_email
    if Rails.env.production?
      email.deliver_later
    else
      email.deliver_now
    end
  end
end
