class Department < ApplicationRecord
  belongs_to :hospital
  has_many :patients
  validates :name, presence: true, uniqueness: { scope: :hospital_id }
end
