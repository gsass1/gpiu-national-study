# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def keycloakopenid
      auth = request.env['omniauth.auth']
      user = SynchronizeUserService.call(auth)

      if user
        flash[:success] = t('signed_in_keycloak')
        sign_in_and_redirect(user, event: :authentication) and return
      end

      flash[:danger] = t('signed_in_keycloak_failed')
      redirect_to root_path
    end

    def failure
      redirect_to root_path
    end
  end
end
