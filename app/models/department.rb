class Department < ApplicationRecord
  include AdminResource

  belongs_to :hospital
  has_many :patients
  validates :name, presence: true, uniqueness: { scope: :hospital_id }

  viewable_admin_table_fields :name, :hospital
  editable_admin_fields :name, :hospital

  def to_s
    name
  end
end
