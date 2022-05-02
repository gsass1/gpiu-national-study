# frozen_string_literal: true

RSpec.shared_examples_for 'a UTI/SSI questionnaire' do |type:|
  shared_context 'sub section' do |no:|
    before do
      find("#sub_section_toggle_#{no}").click
    end
  end

  describe 'section 1' do
    include_context 'sub section', no: 1

    it 'toggles severity levels' do
      within '#sub_section_1' do
        (1..4).each do |level|
          expect(page).not_to have_selector("#severity_level_#{level}_select")

          check "Severity level #{level}"

          expect(page).to have_selector("#severity_level_#{level}_select")
        end
      end
    end
  end

  describe 'section 2' do
    include_context 'sub section', no: 2

    describe 'ii. Urinary tract obstruction (any level) or reflux considered to be a significant risk factor for the current infection' do
      it_behaves_like 'a yes/no form control',
                      input_selector: ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_tract_obstruction",
                      elem_selector: '#tractobstruction_question'

      context 'when yes chosen' do
        before do
          within ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_tract_obstruction" do
            choose 'Yes'
          end
        end

        it_behaves_like 'a checkbox form control',
                        input_selector: '#tractobstruction_question',
                        checkbox: 'Left side',
                        elem_selector: '#tract_obstruction_left_question'

        it_behaves_like 'a checkbox form control',
                        input_selector: '#tractobstruction_question',
                        checkbox: 'Right side',
                        elem_selector: '#tract_obstruction_right_question'
      end
    end

    describe 'iii. Urinary stones (more than one location can be reported)' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_urinarystones",
                      elem_selector: '#urinarystones_question'
    end

    describe 'iv. Antibiotic treatment for any reason within the previous three months' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_antibiotic_treatment",
                      elem_selector: '#treatment_questions'

      context 'when yes chosen' do
        before do
          within ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_antibiotic_treatment" do
            choose 'Yes'
          end

          it_behaves_like 'a checkbox form control',
                          input_selector: '#treatment_questions',
                          checkbox: 'For other infections (please specify if possible)',
                          elem_selector: '#treatment_specify'
        end
      end
    end

    describe 'vi. Catheter at the time when UTI/SSI was diagnosed (more than one location can be reported)' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_catheter",
                      elem_selector: '#catheter_question'

      context 'when yes chosen' do
        before do
          within ".#{type}_questionnaire_patient_uti_ssi_history_appendix_urological_risk_factor_catheter" do
            choose 'Yes'
          end
        end

        it_behaves_like 'a checkbox form control',
                        input_selector: '#catheter_question',
                        checkbox: 'Other',
                        elem_selector: '#catheter_other_specify_question'
      end
    end
  end

  describe 'section 3' do
    include_context 'sub section', no: 3

    shared_examples 'toggles urological intervention categories' do |type:|
      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Endoscopic',
                      elem_selector: "#endoscopic_#{type}_questions"

      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Percutaneous',
                      elem_selector: "#percutaneous_#{type}_questions"

      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Laparoscopic and robot assisted procedures',
                      elem_selector: "#laparoscopic_#{type}_questions"

      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Open surgery',
                      elem_selector: "#open_surgery_#{type}_questions"

      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Prostate biopsy',
                      elem_selector: "#prostate_biopsy_#{type}_questions"

      it_behaves_like 'a checkbox form control',
                      input_selector: "#performed_#{type}_questions",
                      checkbox: 'Others',
                      elem_selector: "#others_#{type}_questions"
    end

    case type
    when 'uti'
      describe 'Urological intervention which according to the investigator lead to the current episode of UTI' do
        it_behaves_like 'a radio form control',
                        input_selector: '.uti_questionnaire_patient_uti_ssi_history_appendix_urological_intervention_performed_uti',
                        chosen_value: 'Following intervention(s):',
                        elem_selector: '#performed_uti_questions'

        context 'when Following intervention(s) is chosen' do
          before do
            within '.uti_questionnaire_patient_uti_ssi_history_appendix_urological_intervention_performed_uti' do
              choose 'Following intervention(s):'
            end
          end

          it_behaves_like 'toggles urological intervention categories', type: 'uti'
        end
      end
    when 'ssi'
      it_behaves_like 'toggles urological intervention categories', type: 'ssi'
    end
  end

  describe 'section 4' do
    include_context 'sub section', no: 4

    it 'displays UTI diagnosis date' do
      expect(page).to have_content("Date when #{type.upcase} was diagnosed")
    end

    it_behaves_like 'a radio form control',
                    input_selector: ".#{type}_questionnaire_patient_uti_ssi_history_appendix_clinical_diagnosis_diagnosis_#{type}",
                    chosen_value: 'Other',
                    elem_selector: "#clinicaldiagnosis_#{type}_question"
  end

  describe 'section 5' do
    include_context 'sub section', no: 5

    it_behaves_like 'a yes/no/unknown form control',
                    input_selector: ".#{type}_questionnaire_appendix_microbiological_information_proven",
                    elem_selector: '#provennauti_questions'

    it_behaves_like 'a yes/no/unknown form control',
                    input_selector: ".#{type}_questionnaire_appendix_microbiological_information_culture_antibiotics",
                    elem_selector: '#antibioticculture_questions'

    describe 'i. Is the patient considered to have a microbiologically proven (culture-positive) UTI' do
      context 'when Yes chosen' do
        before do
          within ".#{type}_questionnaire_appendix_microbiological_information_proven" do
            choose 'Yes'
          end
        end

        it_behaves_like 'a checkbox form control',
                        input_selector: '#provennauti_questions',
                        checkbox: 'Urine',
                        elem_selector: '#culture_result_urine'

        it_behaves_like 'a checkbox form control',
                        input_selector: '#provennauti_questions',
                        checkbox: 'Blood',
                        elem_selector: '#culture_result_blood'

        it_behaves_like 'a checkbox form control',
                        input_selector: '#provennauti_questions',
                        checkbox: 'Discharge/swab from a wound',
                        elem_selector: '#culture_result_swab'

        it_behaves_like 'a checkbox form control',
                        input_selector: '#provennauti_questions',
                        checkbox: 'Other',
                        elem_selector: '#culturetissue_other_question'
      end
    end
  end

  describe 'section 6' do
    include_context 'sub section', no: 6

    it_behaves_like 'a radio form control',
                    input_selector: ".#{type}_questionnaire_appendix_antimicrobial_treatment_treatment",
                    chosen_value: 'Oral',
                    elem_selector: '#treatment_antibiotics'

    it_behaves_like 'a radio form control',
                    input_selector: ".#{type}_questionnaire_appendix_antimicrobial_treatment_treatment",
                    chosen_value: 'Parenteral',
                    elem_selector: '#treatment_antibiotics'

    it_behaves_like 'a radio form control',
                    input_selector: ".#{type}_questionnaire_appendix_antimicrobial_treatment_treatment",
                    chosen_value: 'Both',
                    elem_selector: '#treatment_antibiotics'
  end
end
