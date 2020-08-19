class Country < ApplicationRecord
  resourcify

  has_many :hospitals

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true
end
