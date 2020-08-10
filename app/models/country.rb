class Country < ApplicationRecord
  validates :iso, presence: true
  validates :name, presence: true
end
