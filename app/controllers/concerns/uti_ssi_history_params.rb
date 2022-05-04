# frozen_string_literal: true

module UtiSsiHistoryParams
  extend ActiveSupport::Concern

  private

  def uti_ssi_history_params
    [
      :id,
      { appendix_comorbidity_attributes: appendix_comorbidity_params,
        appendix_urological_risk_factor_attributes: [
          :id,
          :previous,
          :tract_obstruction,
          :tract_obstruction_left,
          :tract_obstruction_right,
          :bladder_outlet_obstruction,
          :urinarystones,
          :urinarystones_calyceal,
          :urinarystones_renalpelvic,
          :urinarystones_ureteral,
          :urinarystones_bladder,
          :antibiotic_treatment,
          :antibiotic_treatment_type,
          :antibiotic_treatment_specify,
          :hospitalisation,
          :hospitalisation_specify,
          :catheter,
          :catheter_urethral,
          :catheter_suprapubic,
          :catheter_ureteralstent,
          :catheter_nephrostomy,
          :catheter_others,
          :catheter_other_specify,
          :catheterduration,

          { appendix_urinary_tract_obstructions_attributes: %i[
            id
            pos_id
            lower
            middle
            upper
            ureteropelvic_junction
          ],

            appendix_antibiotic_attributes: appendix_antibiotic_params }
        ],
        appendix_urological_intervention_attributes: %i[
          id
          performed_uti
          intervention_endoscopic_uti
          cystoscopy_uti
          diagnostic_ureterorenoscopy_uti
          tur_p_uti
          tur_bt_uti
          urs_with_stone_treatment_uti
          pcnl_uti
          ureteral_stent_placement_uti
          endoscopic_other_uti
          endoscopic_specify_uti
          intervention_percutaneous_uti
          pnp_uti
          percutaneous_other_uti
          percutaneous_specify_uti
          intervention_laparoscopic_uti
          kidney_abdominal_testis_uti
          lymph_node_dissection_uti
          prostatectomy_uti
          cystectomy_and_urinary_diversion_uti
          laparoscopic_other_uti
          laparoscopic_specify_uti
          intervention_open_surgery_uti
          vasectomy_uti
          inguinal_scrotal_and_penile_uti
          rplnd_uti
          open_prostatectomy_uti
          simple_nephrectomy_uti
          radical_nephrectomy_uti
          rrp_uti
          cystectomy_and_urinary_diversion_uti
          open_surgery_other_uti
          open_surgery_specify_uti
          intervention_prostate_biopsy_uti
          transrectal_uti
          perineal_uti
          prostate_biopsy_other_uti
          prostate_biopsy_specify_uti
          intervention_others_uti
          eswl_uti
          contamination_uti

          performed_ssi
          intervention_endoscopic_ssi
          cystoscopy_ssi
          diagnostic_ureterorenoscopy_ssi
          tur_p_ssi
          tur_bt_ssi
          urs_with_stone_treatment_ssi
          pcnl_ssi
          ureteral_stent_placement_ssi
          endoscopic_other_ssi
          endoscopic_specify_ssi
          intervention_percutaneous_ssi
          pnp_ssi
          percutaneous_other_ssi
          percutaneous_specify_ssi
          intervention_laparoscopic_ssi
          kidney_abdominal_testis_ssi
          lymph_node_dissection_ssi
          prostatectomy_ssi
          cystectomy_and_urinary_diversion_ssi
          laparoscopic_other_ssi
          laparoscopic_specify_ssi
          intervention_open_surgery_ssi
          vasectomy_ssi
          inguinal_scrotal_and_penile_ssi
          rplnd_ssi
          open_prostatectomy_ssi
          simple_nephrectomy_ssi
          radical_nephrectomy_ssi
          rrp_ssi
          cystectomy_and_urinary_diversion_ssi
          open_surgery_other_ssi
          open_surgery_specify_ssi
          intervention_prostate_biopsy_ssi
          transrectal_ssi
          perineal_ssi
          prostate_biopsy_other_ssi
          prostate_biopsy_specify_ssi
          intervention_others_ssi
          eswl_ssi
          contamination_ssi
        ],
        appendix_clinical_diagnosis_attributes: %i[
          id
          diagnosis_date_uti
          diagnosis_date_ssi
          diagnosis_uti
          diagnosis_ssi
          diagnosis_specify_uti
          diagnosis_specify_ssi

          cdc_uti_symptomatic_uti_and_bacteria
          cdc_uti_symptomatic_uti_and_other
          cdc_uti_asymptomatic_bact_cath
          cdc_uti_asymptomatic_bact_nocatch
          cdc_uti_other
          cdc_uti_other_specify

          cdc_ssi_superficial
          cdc_ssi_deep
          cdc_ssi_organ
        ] }
    ]
  end
end
