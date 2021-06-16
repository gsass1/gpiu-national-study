class HospitalsController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  load_and_authorize_resource

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("hospitals.index.hospitals"), :hospitals_path

  before_action :ensure_country, only: :create
  before_action :include_address, only: :index

  def index
    @tab = params[:tab] || 'all'

    if @tab == 'my'
      @hospitals = current_user.hospitals
    end

    @hospitals = @hospitals.visible

    unless params[:q].blank?
      if ActiveRecord::Base::connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
        @hospitals = @hospitals.where("similarity(name, ?) > 0.1", params[:q]) .order("similarity(name, #{ActiveRecord::Base.connection.quote(params[:q])}) DESC")
      else
        @hospitals = @hospitals.where("hospitals.name LIKE ?", "%#{params[:q]}%")
      end
    end

    @own_hospitals = current_user.hospitals.includes([:address])
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
    @hospital.build_address
    add_breadcrumb I18n.t("hospitals.new.new_hospital")
  end

  def create
    @hospital.user_id = current_user.id

    if @hospital.save
      flash.notice = "Hospital was created."
      push_submission_notifications
      redirect_to @hospital
    else
      render :new
    end
  end

  private
  def ensure_country
    @hospital.country = current_user.country
  end

  def include_address
    unless @hospitals.nil?
      @hospitals = @hospitals.includes(:address)
    end
  end

  def hospital_params
    params.require(:hospital).permit(:name, :first_department_name, address_attributes: [:street, :zip_code, :city])
  end

  def push_submission_notifications
    User.with_role(:regional_admin, @hospital.country).each do |user|
      Notifier.new.notify(recipient: user, actor: current_user, notifiable: @hospital, action: "hospitals.submission")
    end
  end
end
