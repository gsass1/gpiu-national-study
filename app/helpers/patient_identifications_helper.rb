module PatientIdentificationsHelper
  def radio_button_collection(name, *keys)
    result = []
    keys.each do |key|
      result.append [key, t(".#{name.to_s}.#{key.to_s}")]
    end
    result
  end
end
