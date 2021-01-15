class NotificationsMailer < ApplicationMailer
  add_template_helper NotificationsHelper

  default from: 'gpiu-serpens-mni@lists.thm.de'

  def notification_email
    @notification = params[:notification]
    mail(to: @notification.recipient.email, subject: t("notifications.action.#{@notification.action}.title"))
  end
end
