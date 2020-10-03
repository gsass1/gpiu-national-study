class RegionalAdmin::StudyIterationsController < ApplicationController
  include RegionalAdminAuthenticated
  layout 'regional_admin'
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @study_iteration = StudyIteration.new(study_iteration_params)
    @study_iteration.country_id = current_user.country_id

    if @study_iteration.save
      flash[:success] = "Created study iteration with name \"#{@study_iteration.name}\""
      redirect_to regional_admin_country_study_iterations_path(@country)
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
    @study_iteration = StudyIteration.find(params[:study_iteration_id])

    unless @study_iteration.pending?
      flash[:danger] = "This study iteration was already accepted or declined and cannot be changed anymore. Please create a new study iteration."
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
      return
    end

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
    @study_iteration = StudyIteration.find(params[:study_iteration_id])

    unless @study_iteration.pending?
      flash[:danger] = "This study iteration was already accepted or declined and cannot be changed anymore. Please create a new study iteration."
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
      return
    end

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

  private
  def study_iteration_params
    params.require(:study_iteration).permit(:name)
  end

  def study_range_params
    params.require(:study_range).permit(:start, :end, :comment)
  end
end
