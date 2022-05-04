# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'Login panel' do
    context 'when keycloak is enabled' do
      include_context 'with SSO'

      it 'shows a button for signing into keycloak' do
        visit root_path

        expect(page).to have_link('Sign In')
      end

      context 'when application is running in staging mode' do
        before do
          allow(GPIU).to receive(:staging?).and_return(true)
        end

        xit 'shows two login buttons' do
          visit root_path

          expect(page).to have_link('Sign in with keycloak.local')
          expect(page).to have_link('Sign in locally')
        end
      end
    end
  end
end
