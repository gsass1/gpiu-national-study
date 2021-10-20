# frozen_string_literal: true

module RegionalAdmin
  class HospitalsController < ApplicationController
    include RegionalAdminAuthenticated
    include Admin::ResourcePage
    layout 'regional_admin'

    def set_state
      @hospital = @country.hospitals.find_by(id: params[:hospital_id])
      if @hospital.update(acceptance_state: params[:state])
        flash[:success] = "Set acceptance state of #{@hospital.name} to #{params[:state]}"
        push_notifications
      else
        flash[:danger] = 'Failed setting hospital state'
      end

      redirect_to regional_admin_country_hospital_path(@country, @hospital)
    end

    private

    def push_notifications
      Notifier.notify(recipient: @hospital.user, actor: current_user, notifiable: @hospital,
                      action: "hospitals.#{@hospital.approved? ? 'accepted' : 'rejected'}")
    end
  end
end
