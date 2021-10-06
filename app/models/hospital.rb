class Hospital < ApplicationRecord
  include Discard::Model
  include Notifiable

  belongs_to :address, dependent: :destroy
  belongs_to :country
  belongs_to :user
  has_many :departments
  has_many :patients, through: :departments
  accepts_nested_attributes_for :address

  enum acceptance_state: [:pending, :approved, :rejected]
  scope :visible, -> { where(acceptance_state: :approved) }

  validates :name, presence: true

  # NOTE(gian): this gets assigned by the 'new hospital' form. This is a bit
  # more elegant than having the controller do everything
  unless Rails.env.test?
    attr_accessor :first_department_name
    after_create :create_first_department

    validates :first_department_name, presence: true, on: :create
  end

  notify_with Proc.new { |f|
    {
      site_link: Rails.application.routes.url_helpers.hospital_path(f),
      admin_link: Rails.application.routes.url_helpers.regional_admin_country_hospital_path(f.country, f)
    }
  }

  def to_s
    name
  end

  def patient_count
    self.departments.to_a.sum(&:patient_count)
  end

  def employee_count
    self.departments.to_a.sum do |d|
      d.employees.count
    end
  end

  private

  def create_first_department
    departments.create name: first_department_name
  end
end
