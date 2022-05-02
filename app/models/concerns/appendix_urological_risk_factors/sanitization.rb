# frozen_string_literal: true

module AppendixUrologicalRiskFactors
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_obstruction, unless: :tract_obstruction
      before_validation :sanitize_left_obstruction, unless: :tract_obstruction_left
      before_validation :sanitize_right_obstruction, unless: :tract_obstruction_right

      before_validation :sanitize_treatment, unless: proc { |f| f.antibiotic_treatment == 'yes' }
      before_validation :sanitize_treatment_specification, unless: proc { |f| f.antibiotic_treatment_type == 'other' }

      before_validation :sanitize_hospitalisation_specification, unless: :hospitalisation

      before_validation :sanitize_catheter, unless: proc { |f| f.catheter == 'yes' }
      before_validation :sanitize_catheter_specification, unless: :catheter_others
    end

    private

    def sanitize_obstruction
      self.tract_obstruction_left = false
      self.tract_obstruction_right = false
      self.bladder_outlet_obstruction = false
    end

    def sanitize_left_obstruction
      left_urinary_tract_obstruction&.clear
    end

    def sanitize_right_obstruction
      right_urinary_tract_obstruction&.clear
    end

    def sanitize_treatment
      self.antibiotic_treatment_type = nil
    end

    def sanitize_treatment_specification
      self.antibiotic_treatment_specify = nil
    end

    def sanitize_hospitalisation_specification
      self.hospitalisation_specify = nil
    end

    def sanitize_catheter
      self.catheter_urethral = false
      self.catheter_suprapubic = false
      self.catheter_nephrostomy = false
      self.catheter_others = false

      self.catheterduration = (0 if catheter == 'no')
    end

    def sanitize_catheter_specification
      self.catheter_other_specify = nil
    end
  end
end
