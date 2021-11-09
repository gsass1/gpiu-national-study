# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'Login panel' do
    context 'when keycloak is disabed' do
      it 'shows a sign in form' do
        visit root_path

        expect(page).to have_selector(:button, 'Log in')
      end

      it 'can log in' do
        user = create(:user)

        visit root_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'

        click_button 'Log in'
        expect(page).to have_content('This is your user dashboard')
      end
    end

    context 'when keycloak is enabled' do
      include_context 'with SSO'

      it 'shows a button for signing into keycloak' do
        visit root_path

        expect(page).to have_link('Sign in with keycloak.local')
      end

      context 'when application is running in staging mode' do
        before do
          allow(Gpiu).to receive(:staging?).and_return(true)
        end

        it 'should show two login buttons' do
          visit root_path

          expect(page).to have_link('Sign in with keycloak.local')
          expect(page).to have_link('Sign in locally')
        end
      end
    end
  end
end
