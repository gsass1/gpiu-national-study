# frozen_string_literal: true

module AppendixUrologicalRiskFactors
  module Validation
    extend ActiveSupport::Concern

    included do
      validates_boolean :previous

      validates_boolean :tract_obstruction
      validate :tract_obstruction_any, if: :tract_obstruction

      validates_yes_no_unknown :urinarystones
      validate :urinarystones_any, if: proc { |f| f.urinarystones == 'yes' }

      validates_yes_no_unknown :antibiotic_treatment
      validates :antibiotic_treatment_type, presence: { if: proc { |f| f.antibiotic_treatment == 'yes' } }

      validates :antibiotic_treatment_specify, presence: { if: proc { |f|
        f.antibiotic_treatment == 'yes' && f.antibiotic_treatment_type == 'other'
      } }

      validates_boolean :hospitalisation

      validates_yes_no_unknown :catheter
      validate :catheter_any, if: proc { |f| f.catheter == 'yes' }

      # TODO: better error message
      # validates_presence_of :catheterduration, if: proc { |f| f.catheter == 'yes' }
      validates :catheterduration, numericality: { greater_than_or_equal_to: 0, message: 'must be a number greater or equal zero', if: proc { |f|
                                                                                                                                         f.catheter == 'yes'
                                                                                                                                       } }
      validates :catheter_other_specify, presence: { if: :catheter_others }
    end

    private

    def tract_obstruction_any
      unless bladder_outlet_obstruction || tract_obstruction_left || tract_obstruction_right
        errors.add(:tract_obstruction,
                   message: 'must select at least one obstruction type')
      end
    end

    def urinarystones_any
      unless urinarystones_calyceal || urinarystones_renalpelvic || urinarystones_ureteral || urinarystones_bladder
        errors.add(:urinarystones,
                   message: 'must select at least one location')
      end
    end

    def catheter_any
      unless catheter_urethral || catheter_suprapubic || catheter_urethral || catheter_ureteralstent || catheter_nephrostomy || catheter_others
        errors.add(:catheter,
                   message: 'must select at least one catheter')
      end
    end
  end
end
