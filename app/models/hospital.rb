# frozen_string_literal: true

class Hospital < ApplicationRecord
  include Discard::Model
  include Notifiable

  include Hospitals::Approvable

  belongs_to :address, dependent: :destroy
  belongs_to :country
  belongs_to :user

  has_many :departments, dependent: :destroy
  has_many :patients, through: :departments
  accepts_nested_attributes_for :address

  validates :name, presence: true

  scope :visible, -> { where(acceptance_state: :accepted, discarded_at: nil) }

  # NOTE(gian): this gets assigned by the 'new hospital' form. This is a bit
  # more elegant than having the controller do everything
  attr_accessor :first_department_name

  validates :first_department_name, presence: true, on: :create unless Rails.env.test?

  after_create :create_first_department

  notify_with(proc { |f|
    {
      site_link: Rails.application.routes.url_helpers.hospital_path(f),
      admin_link: Rails.application.routes.url_helpers.regional_admin_country_hospital_path(f.country, f)
    }
  })

  def to_s
    name
  end

  def patient_count
    departments.to_a.sum(&:patient_count)
  end

  def employee_count
    departments.to_a.sum do |d|
      d.employees.count
    end
  end

  private

  def create_first_department
    departments.create name: first_department_name if first_department_name.present?
  end
end
