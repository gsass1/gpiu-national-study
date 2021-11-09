# frozen_string_literal: true

class DepartmentsController < ApplicationController
  include Authenticated
  before_action :set_hospital

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('hospitals.index.hospitals'), :hospitals_path

  def new
    @department = @hospital.departments.build
    authorize! :create, @department

    add_breadcrumb @hospital.name, hospital_path(@hospital)
    add_breadcrumb I18n.t('departments.new.new_department')
  end

  def create
    @department = @hospital.departments.build(department_params)
    authorize! :create, @department

    if @department.save
      flash.notice = 'Department was created.'
      redirect_to @department.hospital
    else
      render :new
    end
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:hospital_id])
  end

  def department_params
    params.require(:department).permit(:name, :hospital_id)
  end
end
