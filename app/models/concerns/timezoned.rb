# frozen_string_literal: true

require 'tzinfo'

module Timezoned
  extend ActiveSupport::Concern

  included do
    validates :timezone, presence: true, inclusion: { in: TZInfo::Timezone.all_identifiers }

    after_initialize :set_default_timezone
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
    self.timezone ||= 'UTC'
  end

  def tzinfo
    TZInfo::Timezone.get(timezone || 'UTC')
  end
end
