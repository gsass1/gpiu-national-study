# frozen_string_literal: true

class PatientsController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('patients.index.title'), :patients_path

  requires_active_study_iteration only: %i[new create]

  before_action :load_study_iteration, only: %i[index new]
  before_action :load_hospital_department, only: [:new]

  def index
    @departments = current_user.departments.visible
  end

  def new
    add_breadcrumb I18n.t('patients.new.title'), new_hospital_department_patient_path(@hospital, @department)
    @patient = Patient.new(department_id: @department.id, patient_type: params[:type])
  end

  def create
    @patient = Patient.new(patient_params.merge(creator_id: current_user.id,
                                                study_iteration_id: current_study_iteration.id))
    authorize! :create, @patient

    if @patient.save
      flash[:success] = 'Created new patient!'
      redirect_to patients_path
    else
      flash[:alert] = 'Failed to create patient!'
      @department = @patient.department
      @hospital = @department.hospital
      render :new
    end
  end

  def toggle_lock
    @patient = Patient.find(params[:patient_id])
    authorize! :update, @patient

    @patient.locked = !@patient.locked?
    @patient.save!

    flash[:success] = if @patient.locked
                        'Locked patient.'
                      else
                        'Unlocked patient.'
                      end

    redirect_back fallback_location: patients_path
  end

  private

  def load_study_iteration
    @active_range = current_study_iteration.active_range if study_active?
  end

  def load_hospital_department
    @hospital = Hospital.find(params[:hospital_id])
    @department = @hospital.departments.find(params[:department_id])
  end

  def patient_params
    params.require(:patient).permit(:initial, :department_id, :patient_type)
  end
end
