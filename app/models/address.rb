# frozen_string_literal: true

class Address < ApplicationRecord
  include Discard::Model

  has_one :hospital, dependent: :destroy

  validates :city, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true

  def to_s
    "#{street}, #{zip_code} #{city}"
  end
end
