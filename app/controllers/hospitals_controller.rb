# frozen_string_literal: true

class HospitalsController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  load_and_authorize_resource

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('hospitals.index.hospitals'), :hospitals_path

  before_action :ensure_country, only: :create

  def index
    @tab = params[:tab] || 'all'

    @hospitals = Hospitals::QueryService.call(current_user, params[:q])

    @own_hospitals = current_user.hospitals.includes([:address])
    @employed_hospitals = current_user.employed_hospitals.includes([:address])
  end

  def show
    add_breadcrumb @hospital.name

    @tab = params[:tab] || 'overview'

    @department_ids = @hospital.departments.pluck(:id)

    @employees = Employee.where(department_id: @department_ids)
    @employed_user_ids = @employees.select(:user_id).distinct

    @users_employed = User.where(id: @employees.pluck(:user_id)).distinct
  end

  def new
    add_breadcrumb I18n.t('hospitals.new.new_hospital')

    @hospital.build_address
  end

  def create
    @hospital = Hospital.new(hospital_params.merge(user_id: current_user.id, country_id: current_user.country_id))

    if @hospital.save
      flash.notice = 'Hospital was created.'
      redirect_to @hospital
    else
      render :new
    end
  end

  private

  def ensure_country
    @hospital.country = current_user.country
  end

  def hospital_params
    params.require(:hospital).permit(:name, :first_department_name, address_attributes: %i[street zip_code city])
  end
end
