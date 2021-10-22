# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Add study ranges' do
  let(:user) { create(:regional_admin) }
  let(:study_iteration) { create(:study_iteration, country: user.country) }

  before do
    sign_in(user)
  end

  context 'when study iteration is unsubmitted' do
    before do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'schedule')
    end

    context 'valid study range' do
      before do
        select '2025', from: 'study_range[start(1i)]'
        select 'January', from: 'study_range[start(2i)]'
        select '1', from: 'study_range[start(3i)]'

        select '2026', from: 'study_range[end(1i)]'
        select 'January', from: 'study_range[end(2i)]'
        select '1', from: 'study_range[end(3i)]'

        click_button 'Add'
      end

      it 'can create them' do
        expect(page).to have_content('2025-01-01')
        expect(page).to have_content('2026-01-01')
      end

      it 'can delete them' do
        accept_alert do
          click_link 'Delete'
        end

        expect(page).to have_content('Removed study range')
        expect(page).not_to have_content('2025-01-01')
      end
    end

    it 'cannot add invalid study ranges and shows the appropriate error message' do
      select '2020', from: 'study_range[start(1i)]'
      select 'January', from: 'study_range[start(2i)]'
      select '1', from: 'study_range[start(3i)]'

      select '2026', from: 'study_range[end(1i)]'
      select 'January', from: 'study_range[end(2i)]'
      select '1', from: 'study_range[end(3i)]'

      click_button 'Add'
      expect(page).to have_content('Please review the problems below:')
    end
  end

  context 'when study iteration has been submitted' do
    before do
      study_iteration.update(acceptance_state: 'pending')
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'schedule')
    end

    it 'cannot add study ranges' do
      expect(page).not_to have_link('Add')
    end

    it 'cannot remove study ranges' do
      expect(page).not_to have_link('Delete')
    end
  end
end
