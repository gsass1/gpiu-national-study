# frozen_string_literal: true

class PriorValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    record.errors.add(attribute, :date_in_future) if value > Date.today
  end
end
