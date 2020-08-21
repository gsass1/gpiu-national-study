class Department < ApplicationRecord
  belongs_to :hospital
  validates :name, presence: true, uniqueness: { scope: :hospital_id }
end
