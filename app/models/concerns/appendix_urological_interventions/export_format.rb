# frozen_string_literal: true

module AppendixUrologicalInterventions
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        if p.uti_form_needed?
          e.value 'i', p.performed_uti
          if p.performed_uti == 'yes'
            e.prefix 'i' do
              e.value 'a', p.intervention_endoscopic_uti
              if p.intervention_endoscopic_uti
                e.value 'a.1', p.cystoscopy_uti
                e.value 'a.2', p.diagnostic_ureterorenoscopy_uti
                e.value 'a.3', p.tur_p_uti
                e.value 'a.4', p.tur_bt_uti
                e.value 'a.5', p.urs_with_stone_treatment_uti
                e.value 'a.6', p.pcnl_uti
                e.value 'a.7', p.ureteral_stent_placement_uti
                e.value 'a.8', p.endoscopic_other_uti
                e.value 'a.8_specify', p.endoscopic_specify_uti if p.endoscopic_other_uti
              end

              e.value 'b', p.intervention_percutaneous_uti
              if p.intervention_percutaneous_uti
                e.value 'b.1', p.pnp_uti
                e.value 'b.2', p.percutaneous_other_uti
                e.value 'b.2_specify', p.percutaneous_specify_uti if p.percutaneous_other_uti
              end

              e.value 'c', p.intervention_laparoscopic_uti
              if p.intervention_laparoscopic_uti
                e.value 'c.1', p.kidney_abdominal_testis_uti
                e.value 'c.2', p.lymph_node_dissection_uti
                e.value 'c.3', p.prostatectomy_uti
                e.value 'c.4', p.cystectomy_and_urinary_diversion_uti
                e.value 'c.5', p.laparoscopic_other_uti

                e.value 'c.5_specify', p.laparoscopic_specify_uti if p.laparoscopic_other_uti
              end

              e.value 'd', p.intervention_open_surgery_ssi
              if p.intervention_open_surgery_ssi
                e.value 'd.1', p.vasectomy_uti
                e.value 'd.2', p.inguinal_scrotal_and_penile_uti
                e.value 'd.3', p.rplnd_uti
                e.value 'd.4', p.open_prostatectomy_uti
                e.value 'd.5', p.simple_nephrectomy_uti
                e.value 'd.6', p.radical_nephrectomy_uti
                e.value 'd.7', p.rrp_uti
                e.value 'd.8', p.cystectomy_and_urinary_diversion_uti
                e.value 'd.9', p.open_surgery_other_uti

                e.value 'd.9_specify', p.open_surgery_specify_uti if p.open_surgery_other_uti
              end

              e.value 'e', p.intervention_prostate_biopsy_uti
              if p.intervention_prostate_biopsy_uti
                e.value 'e.1', p.transrectal_uti
                e.value 'e.2', p.perineal_uti
                e.value 'e.3', p.prostate_biopsy_other_uti

                e.value 'e.3_specify', p.prostate_biopsy_specify_uti if p.prostate_biopsy_other_uti
              end

              e.value 'f', p.intervention_others_uti
              e.value 'f.1', p.eswl_uti if p.intervention_others_uti

              e.value 'g', p.contamination_uti
            end
          end
        end

        if p.ssi_form_needed?
          e.prefix 'ii' do
            e.value 'a', p.intervention_endoscopic_ssi
            if p.intervention_endoscopic_ssi
              e.value 'a.1', p.cystoscopy_ssi
              e.value 'a.2', p.diagnostic_ureterorenoscopy_ssi
              e.value 'a.3', p.tur_p_ssi
              e.value 'a.4', p.tur_bt_ssi
              e.value 'a.5', p.urs_with_stone_treatment_ssi
              e.value 'a.6', p.pcnl_ssi
              e.value 'a.7', p.ureteral_stent_placement_ssi
              e.value 'a.8', p.endoscopic_other_ssi
              e.value 'a.8_specify', p.endoscopic_specify_ssi if p.endoscopic_other_ssi
            end

            e.value 'b', p.intervention_percutaneous_ssi
            if p.intervention_percutaneous_ssi
              e.value 'b.1', p.pnp_ssi
              e.value 'b.2', p.percutaneous_other_ssi
              e.value 'b.2_specify', p.percutaneous_specify_ssi if p.percutaneous_other_ssi
            end

            e.value 'c', p.intervention_laparoscopic_ssi
            if p.intervention_laparoscopic_ssi
              e.value 'c.1', p.kidney_abdominal_testis_ssi
              e.value 'c.2', p.lymph_node_dissection_ssi
              e.value 'c.3', p.prostatectomy_ssi
              e.value 'c.4', p.cystectomy_and_urinary_diversion_ssi
              e.value 'c.5', p.laparoscopic_other_ssi

              e.value 'c.5_specify', p.laparoscopic_specify_ssi if p.laparoscopic_other_ssi
            end

            e.value 'd', p.intervention_open_surgery_ssi
            if p.intervention_open_surgery_ssi
              e.value 'd.1', p.vasectomy_ssi
              e.value 'd.2', p.inguinal_scrotal_and_penile_ssi
              e.value 'd.3', p.rplnd_ssi
              e.value 'd.4', p.open_prostatectomy_ssi
              e.value 'd.5', p.simple_nephrectomy_ssi
              e.value 'd.6', p.radical_nephrectomy_ssi
              e.value 'd.7', p.rrp_ssi
              e.value 'd.8', p.cystectomy_and_urinary_diversion_ssi
              e.value 'd.9', p.open_surgery_other_ssi

              e.value 'd.9_specify', p.open_surgery_specify_ssi if p.open_surgery_other_ssi
            end

            e.value 'e', p.intervention_prostate_biopsy_ssi
            if p.intervention_prostate_biopsy_ssi
              e.value 'e.1', p.transrectal_ssi
              e.value 'e.2', p.perineal_ssi
              e.value 'e.3', p.prostate_biopsy_other_ssi

              e.value 'e.3_specify', p.prostate_biopsy_specify_ssi if p.prostate_biopsy_other_ssi
            end

            e.value 'f', p.intervention_others_ssi
            e.value 'f.1', p.eswl_ssi if p.intervention_others_ssi

            e.value 'g', p.contamination_ssi
          end
        end
      end
    end
  end
end
