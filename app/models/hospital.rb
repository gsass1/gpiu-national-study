class Hospital < ApplicationRecord
  include Discard::Model

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :departments

  validates :name, presence: true
end
