# frozen_string_literal: true

require 'tzinfo'

class Country < ApplicationRecord
  resourcify

  has_many :hospitals
  has_many :departments, through: :hospitals
  has_many :study_iterations
  has_many :users

  validates :iso_2, presence: true
  validates :iso_3, presence: true
  validates :name, presence: true
  validates :timezone, presence: true, inclusion: { in: TZInfo::Timezone.all_identifiers }

  before_create :set_default_timezone

  def to_s
    name
  end

  def to_param
    iso_2.upcase
  end

  def current_study_iteration
    @current_study_iteration ||= study_iterations.includes([:study_ranges]).accepted.reject(&:passed?).first
  end

  def next_or_current_study_iteration
    @next_or_current_study_iteration ||= study_iterations.accepted.select { |si| si.active? || !si.passed? }.first
  end

  def current_local_day
    current_local_time.to_date
  end

  def current_local_time
    tzinfo.utc_to_local(Time.now.utc)
  end

  def timezone_abbreviation
    tzinfo.current_period.abbreviation.to_s
  end

  private

  def set_default_timezone
    self.timezone = 'UTC'
  end

  def tzinfo
    TZInfo::Timezone.get(timezone || 'UTC')
  end
end
