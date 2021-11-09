# frozen_string_literal: true

module PatientIdentificationsHelper
  def radio_button_collection(name, *keys)
    result = []
    keys.each do |key|
      result.append [key, t(".#{name}.#{key}")]
    end
    result
  end
end
