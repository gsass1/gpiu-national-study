# frozen_string_literal: true

module AppendixUrologicalInterventions
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :performed_uti, presence: { if: :uti_form_needed? }

      validates :contamination_uti, presence: { if: proc { |f| f.performed_uti == 'yes' } }
      validates :contamination_ssi, presence: { if: :ssi_form_needed? }

      validates_category :endoscopic_uti, :intervention_endoscopic_uti
      validates :endoscopic_specify_uti, presence: { if: :endoscopic_other_uti }

      validates_category :percutaneous_uti, :intervention_percutaneous_uti
      validates :percutaneous_specify_uti, presence: { if: :percutaneous_other_uti }

      validates_category :laparoscopic_uti, :intervention_laparoscopic_uti
      validates :laparoscopic_specify_uti, presence: { if: :laparoscopic_other_uti }

      validates_category :open_surgery_uti, :intervention_open_surgery_uti
      validates :open_surgery_specify_uti, presence: { if: :open_surgery_other_uti }

      validates_category :prostate_biopsy_uti, :intervention_prostate_biopsy_uti
      validates :prostate_biopsy_specify_uti, presence: { if: :prostate_biopsy_other_uti }

      validates_category :others_uti, :intervention_others_uti

      validates_category :endoscopic_ssi, :intervention_endoscopic_ssi
      validates :endoscopic_specify_ssi, presence: { if: :endoscopic_other_ssi }

      validates_category :percutaneous_ssi, :intervention_percutaneous_ssi
      validates :percutaneous_specify_ssi, presence: { if: :percutaneous_other_ssi }

      validates_category :laparoscopic_ssi, :intervention_laparoscopic_ssi
      validates :laparoscopic_specify_ssi, presence: { if: :laparoscopic_other_ssi }

      validates_category :open_surgery_ssi, :intervention_open_surgery_ssi
      validates :open_surgery_specify_ssi, presence: { if: :open_surgery_other_ssi }

      validates_category :prostate_biopsy_ssi, :intervention_prostate_biopsy_ssi
      validates :prostate_biopsy_specify_ssi, presence: { if: :prostate_biopsy_other_ssi }

      validates_category :others_ssi, :intervention_others_ssi
    end

    class_methods do
      def validates_category(category, condition)
        validates_each category do |record, _attr, value|
          if record.send(condition) && (value <= 0)
            record.errors.add(condition, 'must select at least one intervention')
          end
        end
      end
    end
  end
end
