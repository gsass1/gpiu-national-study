# frozen_string_literal: true

require 'uri'

class SupportRequest < ApplicationRecord
  include Discard::Model

  belongs_to :user

  validates :message, presence: true
  validates :email, presence: true

  enum state: { open: 0, closed: 1 }, _prefix: true

  enum support_type: { site_help: 0, bug: 1, other_reason: 2 }

  validates :message, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :support_type, presence: true
  validates :custom_support_type, presence: true, if: proc { |f| f.other_reason? }

  def actual_support_type
    other_reason? ? custom_support_type : support_type
  end

  def to_s
    "Support Request ##{id}"
  end
end
