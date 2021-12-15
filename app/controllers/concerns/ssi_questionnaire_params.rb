# frozen_string_literal: true

module SsiQuestionnaireParams
  extend ActiveSupport::Concern

  private

  def ssi_questionnaire_permitted_params
    [
      :previous,
      :tractobstruction,
      :tractobjstructionspecify,
      :urinarystones_calyceal,
      :urinarystones_renalpelvic,
      :urinarystones_ureteral,
      :urinarystones_bladder,
      :treatment,
      :treatmentspecify,
      :hospitalisation,
      :catheter_urethral,
      :catheter_suprapubic,
      :catheter_ureteralstent,
      :catheter_nephrostomy,
      :catheter_others,
      :catheterduration,
      :intervention_endoscopic,
      :intervention_percutaneous,
      :intervention_laparoscopic,
      :intervention_opensurgery,
      :intervention_transrectal,
      :intervention_others,
      :intervention_contamination,
      :diagnosedate,
      :clinicaldiagnosis,
      :clinicaldiagnosisspecify,
      :symptomaticutiandother,
      :asymptomaticbactcath,
      :asymptomaticbactnocath,
      :otheruti,
      :provennauti,
      :culturetissue_urine,
      :culturetissue_blood,
      :culturetissue_fluidswab,
      :culturetissue_other,
      :culturetissue_specify,
      :antibioticculture,
      :treatment,
      :trus_biopsy,
      :protatebiopsy,
      :superficialssi,
      :deepssi,
      :organssi,
      :symptomaticutiandbacteriuria,
      :antimicrobial_treatment,
      { appendix_comorbidity_attributes: appendix_comorbidity_params,
        appendix_antibiotics_attributes: appendix_antibiotic_params,
        appendix_culture_result_attributes: appendix_culture_result_params }
    ]
  end
end
