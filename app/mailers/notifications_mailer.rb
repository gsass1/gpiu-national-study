class NotificationsMailer < ApplicationMailer
  add_template_helper NotificationsHelper

  default from: 'gpiu-serpens-mni@lists.thm.de'

  def notification_email
    options_hash = params[:notification]
    @notification = OpenStruct.new({
      actor: User.find(options_hash[:actor_id]),
      recipient: User.find(options_hash[:recipient_id]),
      action: options_hash[:action],
      notifiable: options_hash[:notifiable_class].constantize.find(options_hash[:notifiable_id])
    })
    mail(to: @notification.recipient.email, subject: t("notifications.action.#{@notification.action}.title"))
  end
end
