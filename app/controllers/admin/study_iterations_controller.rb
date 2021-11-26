# frozen_string_literal: true

module Admin
  class StudyIterationsController < ApplicationController
    include AdminAuthenticated
    include ExportData
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
      else
        flash[:danger] = 'Failed approving study iteration'
      end

      redirect_to admin_study_iteration_path(@study_iteration)
    end

    def reject
      @study_iteration.acceptance_state = :declined
      if @study_iteration.update(rejection_params)
        flash[:success] = "Rejected study iteration \"#{@study_iteration.name}\""
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
      return if export_study_iteration

      redirect_to admin_study_iteration_path(@study_iteration, tab: :data)
    end

    private

    def rejection_params
      params.require(:study_iteration).permit(:rejection_reason)
    end

    def load_study_iteration
      @study_iteration = StudyIteration.find(params[:study_iteration_id])
    end
  end
end
