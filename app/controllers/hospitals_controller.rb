class HospitalsController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("hospitals.index.hospitals"), :hospitals_path

  before_action :ensure_country, only: :create
  before_action :only_local_hospitals

  def index
    unless params[:q].blank?
      @hospitals = @hospitals.where("name LIKE ?", "%#{params[:q]}%")
    end
  end

  def show
    add_breadcrumb @hospital.name
  end

  def new
    @hospital.build_address
    add_breadcrumb I18n.t("hospitals.new.new_hospital")
  end

  def create
    if @hospital.save
      flash.notice = "Hospital was created."
      redirect_to @hospital
    else
      render :new
    end
  end


  private

  def ensure_country
    @hospital.country = current_user.country
  end

  def only_local_hospitals
    unless @hospitals.nil?
      @hospitals = @hospitals.includes([:address]).where(country_id: current_user.country_id)
    end
  end

  def hospital_params
    params.require(:hospital).permit(:name, :first_department_name, address_attributes: [:street, :zip_code, :city])
  end
end
