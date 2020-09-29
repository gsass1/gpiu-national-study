class Country < ApplicationRecord
  resourcify

  has_many :hospitals
  has_many :study_iterations

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true

  def to_s
    name
  end

  def to_param
    iso_2.upcase
  end

  # TODO(gian): maybe cache this.
  def current_study_iteration
    study_iterations.where(:acceptance_state => :accepted).select { |si| si.active? }.first
  end

  def next_or_current_study_iteration
    study_iterations.where(:acceptance_state => :accepted).select { |si| si.active? && !si.passed? }.first
  end
end
