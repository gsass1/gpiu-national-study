class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    # Allow external users to update without specifying their password
    if resource.external?
      resource.update_without_password(params)
    else
      super.update_resource(resource, params)
    end
  end
end
