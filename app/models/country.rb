class Country < ApplicationRecord
  resourcify

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true
end
