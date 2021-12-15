# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Authenticated

  before_action :set_notification, only: :destroy

  def index
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc).includes(:notifiable)

    # Update unread notifications
    @notifications.each(&:read!)

    if params[:dropdown].present?
      render partial: 'shared/notifications_dropdown', locals: { notifications: @notifications }, layout: false
    else
      @notifications = @notifications.includes(:actor, :recipient)
      render :index
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
