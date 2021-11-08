# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SSO Logout', type: :request do
  include_context 'with SSO'

  context 'when SSO user signs out' do
    before do
      sign_in(create(:user, :registered_through_keycloak, country: create(:country)))
      delete destroy_user_session_path
    end

    it 'redirects to the keycloak sign out endpoint' do
      expect(response).to redirect_to(Keycloak.logout_url(root_url))
    end

    context 'when user returns to dashboard' do
      before do
        get dashboard_index_path
      end

      it 'user is signed out' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when normal user signs out' do
    before do
      sign_in(create(:user))
      delete destroy_user_session_path
    end

    it 'redirects to the root' do
      expect(response).to redirect_to(root_url)
    end
  end
end
