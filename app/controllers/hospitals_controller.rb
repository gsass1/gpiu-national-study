class HospitalsController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  before_action :ensure_country, only: :create
  before_action :only_local_hospitals

  def index; end
  def show; end

  def new
    @hospital.build_address
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
    @hospital.address.country = current_user.country
  end

  def only_local_hospitals
    unless @hospitals.nil?
      @hospitals = @hospitals.includes(:address).where(:addresses => { country_id: current_user.country_id })
    end
  end

  def hospital_params
    params.require(:hospital).permit(:name, address_attributes: [:street, :postal_code, :city])
  end
end
