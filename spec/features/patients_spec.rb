require 'rails_helper'

RSpec.describe 'Patient management' do
  let(:user) { create(:user) }
  let(:hospital) { create(:hospital, country: user.country) }
  let(:department) { create(:department, hospital: hospital) }
  let(:study_iteration) { create(:study_iteration, country: user.country, acceptance_state: 'accepted') }

  before do
    study_iteration.study_ranges.create!(start: 14.days.from_now, end: 30.days.from_now)
    travel 14.days
    sign_in(user)
  end

  context 'user is unemployed' do
    it 'should tell the user to check into a department' do
      visit patients_path

      expect(page).to have_content("Please check into a department first before creating patients.")
    end
  end

  context 'user is employed' do
    before do
      create(:employee, user: user, department: department)
    end

    it 'shows the users departments' do
      visit patients_path

      expect(page).to have_content(department.name)
    end

    it 'should allow the user to create a patient' do
      visit patients_path

      click_link 'New Patient', match: :first
      fill_in 'Initial', with: '123'
      click_button 'Create'

      expect(page).to have_content('123')
    end

    it 'should allow the user to lock and unlock patients', js: true do
      visit patients_path

      click_link 'New Patient', match: :first
      fill_in 'Initial', with: '123'
      click_button 'Create'

      find(:css, "a[title='Lock this patient (prevents further edits)'").click
      expect(Patient.last.locked?).to eq(true)

      find(:css, "a[title='Unlock this patient (enables further edits)'").click
      expect(Patient.last.locked?).to eq(false)
    end

    it 'displays the questionnaire buttons for the appropriate infection types', js: true do
      visit patients_path

      # Create patient
      click_link 'New Patient', match: :first
      fill_in 'Initial', with: '123'
      click_button 'Create'

      # Given that I choose UTI
      click_link 'Include Form ✕ (invalid/missing)'
      select '1999', from: :patient_identification_birth_year
      choose 'Male'
      choose 'UTI'
      click_button 'Update Patient Identification'

      # I should see the UTI form and not the SSI form
      visit patients_path
      expect(page).to have_content('UTI Form ✕ (invalid/missing)')
      expect(page).to_not have_content('SSI Form ✕ (invalid/missing)')

      # Given that I choose SSI
      click_link 'Include Form ✓ (valid)'
      choose 'SSI'
      click_button 'Update Patient Identification'

      # I should see the SSI form and not the UTI form
      visit patients_path
      expect(page).to_not have_content('UTI Form ✕ (invalid/missing)')
      expect(page).to have_content('SSI Form ✕ (invalid/missing)')

      # Given that I choose both
      click_link 'Include Form ✓ (valid)'
      choose 'Both'
      click_button 'Update Patient Identification'

      # I should see the SSI form and the UTI form
      visit patients_path
      expect(page).to have_content('UTI Form ✕ (invalid/missing)')
      expect(page).to have_content('SSI Form ✕ (invalid/missing)')
    end
  end
end
