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

  def itr_color_table(itr)
    if itr.pending?
      "table-default"
    elsif itr.accepted?
      "table-success"
    elsif itr.declined?
      "table-danger"
    end
  end

  def range_color_table(range)
    if range.active?
      "table-success"
    elsif range.passed?
      "table-primary"
    elsif range.pending?
      "table-default"
    end
  end
end
