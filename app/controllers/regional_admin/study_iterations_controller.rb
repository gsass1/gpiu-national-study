class RegionalAdmin::StudyIterationsController < ApplicationController
  include RegionalAdminAuthenticated
  layout 'regional_admin'
  load_and_authorize_resource

  before_action :load_si, :check_si_is_editable, only: [:create_study_range, :delete_study_range, :submit]
  before_action :check_has_ranges, only: [:submit]

  def index
    @study_iterations = @study_iterations.includes([:study_ranges])
  end

  def new
  end

  def create
    @study_iteration = StudyIteration.new(study_iteration_params)
    @study_iteration.country_id = current_user.country_id

    if @study_iteration.save
      flash[:success] = "Created study iteration with name \"#{@study_iteration.name}\""
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    else
      render :new
    end
  end

  def edit
    @study_range = StudyRange.new
  end

  def show
  end

  def destroy
  end

  def create_study_range
    @study_range = StudyRange.new(study_range_params)
    @study_range.study_iteration_id = @study_iteration.id

    if @study_range.save
      flash[:success] = "Added new study range."
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    else
      render :edit
    end
  end

  def delete_study_range
    @study_range = @study_iteration.study_ranges.find(params[:study_range_id])

    if @study_range.active? || @study_range.passed?
      flash[:danger] = "You cannot remove a study range that is active or has already passed."
    else
      if @study_range.destroy
        flash[:success] = "Removed study range."
      else
        flash[:danger] = "Unable to remove study range."
      end
    end

    redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
  end

  def submit
    if @study_iteration.update_attribute(:acceptance_state, :pending)
      flash[:success] = "Submitted for approval."
    else
      flash[:danger] = "Failed to submit for approval."
    end

    redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
  end

  private
  def study_iteration_params
    params.require(:study_iteration).permit(:name)
  end

  def study_range_params
    params.require(:study_range).permit(:start, :end, :comment)
  end

  def load_si
    @study_iteration = StudyIteration.find(params[:study_iteration_id])
  end

  def check_has_ranges
    unless @study_iteration.study_ranges.any?
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration), flash: { danger: "A minimum of one study range is required." }
    end
  end

  def check_si_is_editable
    unless @study_iteration.unsubmitted?
      flash[:danger] = "This study iteration was already accepted or declined and cannot be changed anymore. Please create a new study iteration."
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    end
  end
end
