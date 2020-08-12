class Address < ApplicationRecord
  include Discard::Model

  belongs_to :addressable, polymorphic: true
  belongs_to :country

  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true
end
