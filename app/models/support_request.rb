require 'uri'

class SupportRequest < ApplicationRecord
  include Discard::Model

  belongs_to :user

  validates :message, presence: true
  validates :email, presence: true
  
  enum state: [:open, :closed], _prefix: true

  enum support_type: [:site_help, :bug, :other_reason]

  validates :user_id, presence: true
  validates :message, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :support_type, presence: true
  validates :custom_support_type, presence: true, if: Proc.new { |f| f.other_reason? }

  def actual_support_type
    self.other_reason? ? self.custom_support_type : self.support_type
  end

  def to_s
    "Support Request ##{self.id}"
  end
end
