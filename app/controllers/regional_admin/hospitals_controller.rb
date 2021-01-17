class RegionalAdmin::HospitalsController < ApplicationController
  include RegionalAdminAuthenticated
  include Admin::ResourcePage
  layout 'regional_admin'

  def set_state
    @hospital = @country.hospitals.find_by_id(params[:hospital_id])
    if @hospital.update_attributes(acceptance_state: params[:state])
      flash[:success] = "Set acceptance state of #{@hospital.name} to #{params[:state]}"
    else
      flash[:danger] = "Failed setting hospital state"
    end

    redirect_to regional_admin_country_hospital_path(@country, @hospital)
  end
end
