class Admin::StudyIterationsController < ApplicationController
  include AdminAuthenticated
  layout 'admin'
  load_and_authorize_resource

  before_action :load_study_iteration, only: [:approve, :reject]

  def index
    @study_iterations = @study_iterations.includes([:country, :study_ranges])
  end

  def show
    @study_ranges = @study_iteration.study_ranges

    if @study_ranges.any?
      @months = CalendarUtil::collect_months(@study_ranges.first.start, @study_ranges.last.end)
    else
      @months = []
    end
  end

  def approve
    if @study_iteration.update_attributes(acceptance_state: :accepted)
      flash[:success] = "Approved study iteration \"#{@study_iteration.name}\""
      push_notifications
    else
      flash[:danger] = "Failed approving study iteration"
    end

    redirect_to admin_study_iteration_path(@study_iteration)
  end

  def reject
    @study_iteration.acceptance_state = :declined
    if @study_iteration.update_attributes(rejection_params)
      flash[:success] = "Rejected study iteration \"#{@study_iteration.name}\""
      push_notifications
    else
      flash[:danger] = "Failed rejecting study iteration"
    end

    redirect_to admin_study_iteration_path(@study_iteration)
  end

  private
  def rejection_params
    params.require(:study_iteration).permit(:rejection_reason)
  end

  def load_study_iteration
    @study_iteration = StudyIteration.find(params[:study_iteration_id])
  end

  def push_notifications
    User.with_role(:regional_admin, @study_iteration.country).each do |user|
      Notifier.new.notify(recipient: user, actor: current_user, notifiable: @study_iteration, action: "study_iterations.#{@study_iteration.accepted? ? "accepted" : "rejected"}")
    end
  end
end
