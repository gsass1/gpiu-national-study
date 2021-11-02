# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Manage Roles' do
  include_context 'with admin user'

  let(:user) { create(:user) }

  before do
    # FIXME: how to remove the default user role?
    user.roles.destroy_all
  end

  describe 'roles list' do
    before do
      user.add_role :regional_admin, user.country
      user.add_role :blahblah, user.country
      visit admin_user_roles_path(user.id)
    end

    it 'shows the users roles' do
      expect(page).to have_content('blahblah')
    end
  end

  describe 'role deletion' do
    before do
      user.add_role :regional_admin, user.country
      visit admin_user_roles_path(user.id)
    end

    context 'when the delete button is clicked' do
      before do
        accept_alert do
          click_link 'Delete'
        end
      end

      it 'removes the role' do
        expect(page).to have_content("Removed role 'regional_admin'")
      end

      it 'does not display the role in the table anymore' do
        within 'table' do
          expect(page).not_to have_content('regional_admin')
        end
      end
    end
  end

  describe 'role creation' do
    before do
      visit admin_user_roles_path(user.id)
    end

    context 'when the role is invalid' do
      before do
        within 'form' do
          fill_in 'Name', with: 'blahblah'
          fill_in 'Resource Type', with: 'DoesntExist'
          fill_in 'Resource ID', with: '1337'

          click_button 'Add'
        end
      end

      it 'displays an error' do
        expect(page).to have_content('Failed to add role')
      end
    end

    context 'when role is valid' do
      before do
        within 'form' do
          fill_in 'Name', with: 'supervisor'
          fill_in 'Resource Type', with: 'Country'
          fill_in 'Resource ID', with: user.country.id

          click_button 'Add'
        end
      end

      it 'adds the role' do
        expect(page).to have_content('Added role')
      end

      it 'shows the role in the table' do
        within 'table' do
          expect(page).to have_content('supervisor')
        end
      end
    end
  end
end
