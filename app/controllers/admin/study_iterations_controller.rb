class Admin::StudyIterationsController < ApplicationController
  include AdminAuthenticated
  layout 'admin'
  load_and_authorize_resource

  def index
  end

  def show
  end

  def approve
    @study_iteration = StudyIteration.find(params[:study_iteration_id])
    if @study_iteration.update_attributes(acceptance_state: :accepted)
      flash[:success] = "Approved study iteration \"#{@study_iteration.name}\""
    else
      flash[:danger] = "Failed approving study iteration"
    end

    redirect_to admin_study_iteration_path(@study_iteration)
  end

  def reject
    @study_iteration = StudyIteration.find(params[:study_iteration_id])
    @study_iteration.acceptance_state = :declined
    if @study_iteration.update_attributes(rejection_params)
      flash[:success] = "Rejected study iteration \"#{@study_iteration.name}\""
    else
      flash[:danger] = "Failed rejecting study iteration"
    end

    redirect_to admin_study_iteration_path(@study_iteration)
  end

  private
  def rejection_params
    params.require(:study_iteration).permit(:rejection_reason)
  end
end
