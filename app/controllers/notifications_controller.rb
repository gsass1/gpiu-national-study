class NotificationsController < ApplicationController
  include Authenticated

  def index
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc).includes(:actor, :recipient,
                                                                                                   :notifiable)

    # Update unread notifications
    current_user.unread_notifications.update_all(read_at: DateTime.now)
  end
end
