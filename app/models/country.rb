# frozen_string_literal: true

class Country < ApplicationRecord
  include Timezoned

  resourcify

  has_many :hospitals, dependent: :destroy
  has_many :departments, through: :hospitals
  has_many :study_iterations, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true

  def to_s
    name
  end

  def to_param
    iso_2.upcase
  end

  def current_study_iteration
    @current_study_iteration ||= find_current_study_iteration
  end

  def next_or_current_study_iteration
    @next_or_current_study_iteration ||= find_next_or_current_study_iteration
  end

  def current_and_upcoming_study_iterations
    @current_and_upcoming_study_iterations ||= find_current_and_upcoming_study_iterations
  end

  def all_study_ranges
    study_iterations.sum(&:study_ranges)
  end

  private

  def find_current_study_iteration
    study_iterations.includes([:study_ranges]).accepted.reject(&:passed?).first
  end

  def find_next_or_current_study_iteration
    study_iterations.accepted.select { |si| si.active? || !si.passed? }.first
  end

  def find_current_and_upcoming_study_iterations
    study_iterations.accepted.select { |si| si.active? || !si.passed? }
  end
end
