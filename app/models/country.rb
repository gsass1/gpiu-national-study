class Country < ApplicationRecord
  include AdminResource

  resourcify

  has_many :hospitals
  has_many :departments, through: :hospitals
  has_many :study_iterations
  has_many :users

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true

  viewable_admin_table_fields :name, :iso_2, :iso_3
  editable_admin_fields :name, :iso_2, :iso_3

  def to_s
    name
  end

  def to_param
    iso_2.upcase
  end

  def current_study_iteration
    @current_study_iteration ||= study_iterations.includes([:study_ranges]).accepted.select { |si| !si.passed? }.first
  end

  def next_or_current_study_iteration
    @next_or_current_study_iteration ||= study_iterations.accepted.select { |si| si.active? || !si.passed? }.first
  end
end
