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

    # it 'should allow the user to lock and unlock patients', js: true do
    #   visit patients_path

    #   click_link 'New Patient', match: :first
    #   fill_in 'Initial', with: '123'
    #   click_button 'Create'

    #   click_ujs_link find(:css, "a[title='Lock this patient (prevents further edits)'")
    #   expect(Patient.last.locked?).to eq(true)
    # end
  end
end
