# frozen_string_literal: true

module AppendixUrologicalInterventions
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_interventions_uti, unless: proc { |f| f.performed_uti == 'yes' }
      before_validation :sanitize_interventions_ssi, unless: :ssi_form_needed?

      before_validation :sanitize_intervention_categories_uti
      before_validation :sanitize_intervention_categories_ssi
    end

    private

    def sanitize_interventions_uti
      self.intervention_endoscopic_uti = false
      self.intervention_percutaneous_uti = false
      self.intervention_laparoscopic_uti = false
      self.intervention_open_surgery_uti = false
      self.intervention_others_uti = false
      self.contamination_uti = nil
    end

    def sanitize_interventions_ssi
      self.intervention_endoscopic_ssi = false
      self.intervention_percutaneous_ssi = false
      self.intervention_laparoscopic_ssi = false
      self.intervention_open_surgery_ssi = false
      self.intervention_others_ssi = false
      self.contamination_ssi = nil
    end

    def sanitize_intervention_categories_uti
      self.endoscopic_uti = 0 unless intervention_endoscopic_uti
      self.percutaneous_uti = 0 unless intervention_percutaneous_uti
      self.laparoscopic_uti = 0 unless intervention_laparoscopic_uti
      self.open_surgery_uti = 0 unless intervention_open_surgery_uti
      self.prostate_biopsy_uti = 0 unless intervention_prostate_biopsy_uti
      self.others_uti = 0 unless intervention_others_uti
    end

    def sanitize_intervention_categories_ssi
      self.endoscopic_ssi = 0 unless intervention_endoscopic_ssi
      self.percutaneous_ssi = 0 unless intervention_percutaneous_ssi
      self.laparoscopic_ssi = 0 unless intervention_laparoscopic_ssi
      self.open_surgery_ssi = 0 unless intervention_open_surgery_ssi
      self.prostate_biopsy_ssi = 0 unless intervention_prostate_biopsy_ssi
      self.others_ssi = 0 unless intervention_others_ssi
    end
  end
end
