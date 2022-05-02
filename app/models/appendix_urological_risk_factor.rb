# frozen_string_literal: true

class AppendixUrologicalRiskFactor < ApplicationRecord
  include Antibiotic
  include Exportable
  include ValidateBoolean

  include AppendixUrologicalRiskFactors::Sanitization
  include AppendixUrologicalRiskFactors::Validation
  include AppendixUrologicalRiskFactors::ExportFormat

  belongs_to :uti_ssi_history, optional: true

  has_many :appendix_urinary_tract_obstructions, -> { order('pos_id asc') }, dependent: :destroy
  accepts_nested_attributes_for :appendix_urinary_tract_obstructions

  before_validation unless: :new_record? do
    numbers = []
    appendix_urinary_tract_obstructions.each do |appendix_urinary_tract_obstruction|
      numbers << appendix_urinary_tract_obstruction.pos_id
    end

    ((0..(appendix_urinary_tract_obstruction_count - 1)).to_a - numbers).each do |i|
      appendix_urinary_tract_obstructions.build(pos_id: i)
    end
  end

  def left_urinary_tract_obstruction
    get_urinary_tract_obstruction_at(0)
  end

  def right_urinary_tract_obstruction
    get_urinary_tract_obstruction_at(1)
  end

  private

  def appendix_urinary_tract_obstruction_count
    2
  end

  def get_urinary_tract_obstruction_at(pos_id)
    appendix_urinary_tract_obstructions.each do |appendix_urinary_tract_obstruction|
      return appendix_urinary_tract_obstruction if appendix_urinary_tract_obstruction.pos_id == pos_id
    end
    nil
  end
end
