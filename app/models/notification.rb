# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  def read!
    return unless read_at.nil?

    @new = true
    update!(read_at: DateTime.now)
  end

  def new?
    @new
  end
end
