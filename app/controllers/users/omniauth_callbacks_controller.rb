# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def keycloakopenid
      auth = request.env['omniauth.auth']

      @user = User.from_omniauth(auth)

      if @user.persisted? && @user.synchronize_with_keycloak_info(auth)
        flash[:success] = t('signed_in_keycloak')
        sign_in_and_redirect @user, event: :authentication
      else
        flash[:danger] = t('signed_in_keycloak_failed')
        session['devise.keycloakopenid_data'] = request.env['omniauth.auth'].except('credentials')
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
