# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Authenticated

  before_action :set_notification, only: :destroy

  def index
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc).includes(:actor, :recipient,
                                                                                                   :notifiable)

    # Update unread notifications
    current_user.unread_notifications.each { |n| n.update(read_at: DateTime.now) }

    unless params[:dropdown].present?
      render :index
    else
      render partial: 'shared/notifications_dropdown', locals: { notifications: @notifications }, layout: false
    end
  end

  def destroy
    if @notification.destroy
      flash[:success] = 'Removed notification'
    else
      flash[:danger] = 'Failed to remove notification'
    end

    redirect_to notifications_path
  end

  private

  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
