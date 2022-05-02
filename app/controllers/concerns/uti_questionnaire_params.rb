# frozen_string_literal: true

module UtiQuestionnaireParams
  extend ActiveSupport::Concern

  private

  def uti_questionnaire_permitted_params
    [
      { patient_attributes: [:id, { uti_ssi_history_attributes: uti_ssi_history_params }],
        appendix_microbiological_information_attributes: [
          :id,
          :proven,
          :culture_tissue_urine,
          :culture_tissue_blood,
          :culture_tissue_swab,
          :culture_tissue_other,
          :culture_tissue_other_specify,
          :culture_antibiotics,
          {
            appendix_antibiotic_attributes: appendix_antibiotic_params,
            appendix_culture_results_attributes: appendix_culture_result_params
          }
        ],
        appendix_antimicrobial_treatment_attributes: [
          :id,
          :treatment,
          {
            appendix_antibiotic_attributes: appendix_antibiotic_params
          }
        ] }
    ]
  end
end
