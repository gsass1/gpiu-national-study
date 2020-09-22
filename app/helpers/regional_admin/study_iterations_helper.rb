module RegionalAdmin::StudyIterationsHelper
  def range_state(range)
    if range.active?
      "Active"
    elsif Date.today > range.end
      "Passed"
    else
      days = (range.start - Date.today).to_i
      "Pending (#{days} days remaining)"
    end
  end
end
