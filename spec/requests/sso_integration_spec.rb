# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SSO Integration', type: :request do
  include_context 'with SSO'

  describe 'omniauth callback' do
    before do
      OmniAuth.config.mock_auth[:keycloak] =
        OmniAuth::AuthHash.new(
          {
            uid: '123456789',
            info: {
              first_name: 'Max',
              last_name: 'Mustermann',
              email: 'test@test.com'
            }
          }
        )
    end

    let(:get_callback) do
      get(user_keycloakopenid_omniauth_callback_path,
          params: {},
          headers: { 'omniauth.auth' => OmniAuth.config.mock_auth[:keycloak] })
    end

    context 'when no user exists yet' do
      it 'creates a new user' do
        expect do
          get_callback
        end.to change(User, :count).by(1)
      end

      it 'assigns the correct info' do
        get_callback

        expect(User.last).to have_attributes(name: 'Max', last_name: 'Mustermann', email: 'test@test.com',
                                             keycloak_uid: '123456789')
      end

      it 'creates a successful flash message' do
        get_callback

        expect(flash[:success]).to be_present
      end
    end

    context 'when a user with the same email already exists' do
      before do
        create(:user, email: 'test@test.com')
      end

      it 'does not create a user' do
        expect do
          get_callback
        end.not_to change(User, :count)
      end

      it 'creates an alert flash' do
        get_callback

        expect(flash[:danger]).to be_present
      end
    end

    context 'when a user with the same keycloak uid exists' do
      let!(:user) { create(:user, first_name: 'Peter', last_name: 'Hans', keycloak_uid: '123456789') }

      it 'updates that user' do
        expect do
          get_callback
          user.reload
        end.to change(user, :first_name).from('Peter').to('Max')
      end
    end
  end
end
