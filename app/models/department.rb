class Department < ApplicationRecord
  belongs_to :hospital
  validates :name, presence: true, uniqueness: true
end
