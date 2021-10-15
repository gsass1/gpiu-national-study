require 'rails_helper'

RSpec.describe 'Patients > Include form' do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration) }

  before do
    sign_in(user)
    visit edit_patient_identification_path(patient, patient.patient_identification)
  end

  it_behaves_like 'a questionnaire', name: 'patient identification'

  describe 'form controls' do
    describe 'pregnancy' do
      context 'when male' do
        before do
          choose 'Male'
        end

        it 'should not show Pregnancy' do
          expect(page).not_to have_content('Pregnancy')
        end
      end

      context 'when female' do
        before do
          choose 'Female'
        end

        it 'should show Pregnancy' do
          expect(page).to have_content('Pregnancy')
        end
      end
    end

    describe 'evidence infection' do
      it_behaves_like 'a checkbox form control',
        input_selector: '.patient_identification_evidence_infection',
        checkbox: 'Evidence infection',
        elem_selector: '#admission-infected'
    end
  end

  describe 'setting infection type' do
    before do
      select '1999', from: :patient_identification_birth_year
      choose 'Male'
    end

    context 'when UTI' do
      before do
        set_infection_type('UTI')
      end

      it 'sets the correct infection type' do
        patient.reload
        expect(patient.uti_form_needed?).to eq(true)
        expect(patient.ssi_form_needed?).to eq(false)
      end
    end

    context 'when SSI' do
      before do
        set_infection_type('SSI')
      end

      it 'sets the correct infection type' do
        patient.reload
        expect(patient.uti_form_needed?).to eq(false)
        expect(patient.ssi_form_needed?).to eq(true)
      end
    end

    context 'when Both' do
      before do
        set_infection_type('Both')
      end

      it 'sets the correct infection type' do
        patient.reload
        expect(patient.uti_form_needed?).to eq(true)
        expect(patient.ssi_form_needed?).to eq(true)
      end
    end
  end

  def set_infection_type(type)
    choose type
    click_button 'Submit'
  end
end

