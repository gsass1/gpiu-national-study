class DepartmentsController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("hospitals.index.hospitals"), :hospitals_path

  def new
    @hospital = Hospital.find params[:hospital_id]
    @department.hospital_id = @hospital.id

    add_breadcrumb @hospital.name, hospital_path(@hospital)
    add_breadcrumb I18n.t("departments.new.new_department")
  end

  def create
    if @department.save
      flash.notice = "Department was created."
      redirect_to @department.hospital
    else
      render :new
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :hospital_id)
  end
end
