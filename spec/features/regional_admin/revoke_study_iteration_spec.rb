# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Revoke study iteration' do
  let(:user) { create(:regional_admin) }
  let(:study_iteration) { create(:study_iteration, country: user.country) }

  before do
    sign_in(user)
  end

  describe 'pending study iteration' do
    before do
      study_iteration.update(acceptance_state: :pending)
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')
    end

    it 'displays relevant information' do
      expect(page).to have_content("If you accidentally submitted this study iteration for approval then you can still revoke it, which will set its state back to \"Unsubmitted\".")
    end

    it 'can revoke study iteration' do
      click_button 'Revoke'
      expect(page).to have_content("Revoked study iteration")
      expect(page).to have_content("Unsubmitted")
    end
  end

  describe 'accepted study iteration' do
    before do
      study_iteration.update(acceptance_state: :accepted)
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')
    end

    it 'displays relevant information' do
      expect(page).to have_content("When the study has no started yet you can still revoke this study iteration, which means the study will not be conducted.")
    end

    it 'can revoke study iteration' do
      click_button 'Revoke'
      expect(page).to have_content("Revoked study iteration")
      expect(study_iteration.reload.acceptance_state).to eq('revoked')
    end
  end
end
