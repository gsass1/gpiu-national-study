# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'Login panel' do
    context 'without keycloak enabled' do
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
  end
end
