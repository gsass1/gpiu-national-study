# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Hospitals > Edit Address' do
  include_context 'with admin user'

  let!(:hospital) { create(:hospital) }

  context 'when edit page is visited' do
    before do
      visit edit_admin_hospital_path(hospital)
    end

    context 'when address information is changed' do
      before do
        fill_in 'Street', with: 'Cool Street'
        fill_in 'Zip code', with: '1337'
        fill_in 'City', with: 'Giessen'

        click_button 'Update Hospital'
      end

      it 'updates the address' do
        expect(page).to have_content('Resource was updated.')
      end

      it 'assigns the proper attributes' do
        expect(Hospital.last.address).to have_attributes(street: 'Cool Street', zip_code: '1337', city: 'Giessen')
      end
    end
  end
end
