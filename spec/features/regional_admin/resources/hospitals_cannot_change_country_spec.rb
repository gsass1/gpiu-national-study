# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admin > Resources > Hospitals > Cannot Change Address' do
  include_context 'with regional admin user'
  let!(:hospital) { create(:hospital, country: regional_admin_user.country) }
  let!(:different_country) { create(:country) }

  context 'when visiting the hospital edit page' do
    before do
      visit edit_regional_admin_country_hospital_path(country, hospital)
    end

    context 'when the country is changed' do
      before do
        within '.hospital_country_id' do
          select different_country.name
        end

        click_button 'Update Hospital'
      end

      it 'displays an error' do
        expect(page).to have_content('Unable to update resource because the change would cause you to have insufficient permissions to access it further.')
      end

      it 'does not change the country' do
        expect(hospital.reload.country).not_to eq(different_country)
      end
    end
  end
end
