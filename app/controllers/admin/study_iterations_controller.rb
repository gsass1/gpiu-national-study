# frozen_string_literal: true

module Admin
  class StudyIterationsController < ApplicationController
    include AdminAuthenticated
    layout 'admin'
    load_and_authorize_resource

    add_breadcrumb 'Study Iterations', :admin_study_iterations_path

    before_action :load_study_iteration, only: %i[approve reject export toggle_exportable]

    def index
      @filter = params[:filter] || 'all'

      @study_iterations = @study_iterations.includes(%i[country study_ranges])
      @study_iterations = @study_iterations.where(countries: { iso_2: params[:country] }) if params[:country].present?

      unless @filter == 'all'
        @study_iterations = @study_iterations.select do |si|
          si.send("#{@filter}?") == true
        end
      end
    end

    def show
      @tab = params[:tab] || 'overview'

      @study_ranges = @study_iteration.study_ranges

      @months = if @study_ranges.any?
                  CalendarUtil.collect_months(@study_ranges.first.start, @study_ranges.last.end)
                else
                  []
                end

      add_breadcrumb @study_iteration.name, admin_study_iteration_path(@study_iteration)
    end

    def approve
      if @study_iteration.update(acceptance_state: :accepted)
        flash[:success] = "Approved study iteration \"#{@study_iteration.name}\""
        push_notifications
      else
        flash[:danger] = 'Failed approving study iteration'
      end

      redirect_to admin_study_iteration_path(@study_iteration)
    end

    def reject
      @study_iteration.acceptance_state = :declined
      if @study_iteration.update(rejection_params)
        flash[:success] = "Rejected study iteration \"#{@study_iteration.name}\""
        push_notifications
      else
        flash[:danger] = 'Failed rejecting study iteration'
      end

      redirect_to admin_study_iteration_path(@study_iteration)
    end

    def toggle_exportable
      if @study_iteration.exportable?
        @study_iteration.exportable = false
        flash[:success] = 'Made data unexportable.'
      else
        @study_iteration.exportable = true
        flash[:success] = 'Made data exportable.'
      end

      @study_iteration.save

      redirect_to admin_study_iteration_path(@study_iteration, tab: :actions)
    end

    def export
      @type_of_data = params[:type_of_data]
      case @type_of_data
      when 'uti_ssi_patients'
        @csv_data = Patient.as_csv_collection(@study_iteration.patients.uti_ssi)
      when 'prostate_biopsy_patients'
        @csv_data = Patient.as_csv_collection(@study_iteration.patients.prostate_biopsy)
      when 'hospitals'
        @csv_data = Department.as_csv_collection(@study_iteration.departments)
      else
        return
      end

      send_data @csv_data, filename: "#{@study_iteration.name.to_param}-#{@type_of_data}.csv"
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
        Notifier.notify(recipient: user, actor: current_user, notifiable: @study_iteration,
                            action: "study_iterations.#{@study_iteration.accepted? ? 'accepted' : 'rejected'}")
      end
    end
  end
end
