# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patients > Create patient' do
  let(:user) { create(:user) }
  let(:hospital) { create(:hospital, country: user.country) }

  before do
    sign_in(user)
  end

  context 'when user is unemployed' do
    before do
      user.employed.destroy_all
    end

    it 'reminds the user to check into a department' do
      visit patients_path

      expect(page).to have_content('Please check into a department first before creating patients.')
    end
  end

  context 'when user is employed' do
    let(:department) { create(:department, hospital: hospital) }
    let(:study_iteration) { create(:study_iteration, country: user.country, acceptance_state: 'accepted') }

    before do
      study_iteration.study_ranges.create!(start: 14.days.from_now, end: 30.days.from_now)
      travel 14.days
      create(:employee, user: user, department: department)
    end

    it 'shows the users departments' do
      visit patients_path

      expect(page).to have_content(department.name)
    end

    describe 'UTI/SSI' do
      it 'can create a new patient' do
        visit patients_path

        find(:css, "div#uti-ssi-#{department.id}").click_link 'New Patient'

        fill_in 'Initial', with: '1337'
        click_button 'Create'

        expect(Patient.last.patient_type).to eq('uti_ssi')
        expect(Patient.last.initial).to eq('1337')
      end
    end

    describe 'Prostate Biopsy' do
      it 'can create a new patient' do
        visit patients_path

        find(:css, "div#biopsy-#{department.id}").click_link 'New Patient'

        fill_in 'Initial', with: '1337'
        click_button 'Create'

        expect(Patient.last.patient_type).to eq('prostate_biopsy')
        expect(Patient.last.initial).to eq('1337')
      end
    end
  end
end
