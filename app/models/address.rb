class Address < ApplicationRecord
  include Discard::Model

  has_one :hospital

  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true
end
