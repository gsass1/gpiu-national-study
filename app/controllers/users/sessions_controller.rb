# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # DELETE /resource/sign_out
    def destroy
      resource = current_user
      # https://github.com/heartcombo/devise/blob/main/app/controllers/devise/sessions_controller.rb#L27
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      set_flash_message! :notice, :signed_out if signed_out
      yield if block_given?

      redirect_to(Keycloak.logout_url(root_url)) and return if resource.external?

      respond_to_on_destroy
    end
  end
end
