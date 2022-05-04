# frozen_string_literal: true

class AppendixUrinaryTractObstruction < ApplicationRecord
  include Exportable

  belongs_to :appendix_urological_risk_factors, optional: true

  exports_as do |e, p|
    e.value '1', p.lower
    e.value '2', p.middle
    e.value '3', p.upper
    e.value '4', p.ureteropelvic_junction
  end

  def clear
    self.lower = false
    self.middle = false
    self.upper = false
    self.ureteropelvic_junction = false
  end
end
