# frozen_string_literal: true

module RegionalAdmin
  class StudyIterationsController < ApplicationController
    include RegionalAdminAuthenticated
    include Admin::ExportData
    include Tabable

    layout 'regional_admin'
    load_and_authorize_resource

    before_action :load_si, :check_si_is_editable, only: %i[create_study_range delete_study_range submit]
    before_action :load_si, only: %i[export revoke request_export_permission]
    before_action :check_has_ranges, only: [:submit]

    tabbed :edit, tabs: %i[overview data schedule calendar actions], default: :overview
    before_action :load_calendar_months, only: [:edit]

    def index
      @study_iterations = @country.study_iterations.includes([:study_ranges])
    end

    def new; end

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

    def show; end

    def destroy; end

    def create_study_range
      @study_range = StudyRange.new(study_range_params)
      @study_range.study_iteration_id = @study_iteration.id

      if @study_range.save
        flash[:success] = 'Added new study range.'
        redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration, tab: 'schedule')
      else
        setup_tabs_for_edit!
        @current_tab = :schedule
        load_calendar_months
        render :edit
      end
    end

    def delete_study_range
      @study_range = @study_iteration.study_ranges.find(params[:study_range_id])

      if !@study_range.can_be_removed?
        flash[:danger] = 'You cannot remove a study range that is active or has already passed.'
      elsif @study_range.destroy
        flash[:success] = 'Removed study range.'
      else
        flash[:danger] = 'Unable to remove study range.'
      end

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration, tab: 'schedule')
    end

    def submit
      if @study_iteration.update(acceptance_state: :pending)
        flash[:success] = 'Submitted for approval.'
      else
        flash[:danger] = 'Failed to submit for approval.'
      end

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    end

    def export
      return if export_study_iteration

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    end

    def request_export_permission
      if @study_iteration.passed?
        if @study_iteration.request_permission_timeout?
          flash[:danger] = 'You have already made a request previously. Please wait.'
        elsif @study_iteration.request_export_permission
          flash[:success] = 'Request for export permission has been sent to the super admins.'
        else
          flash[:danger] = 'There was an error requesting export permission.'
        end
      else
        flash[:danger] = 'Study Iteration has not passed yet'
      end

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    end

    def revoke
      redirect_back danger: 'Study iteration is not revokable', fallback_location: root_path and return unless @study_iteration.revokable?

      if @study_iteration.accepted?
        @study_iteration.acceptance_state = :revoked
      else
        @study_iteration.acceptance_state = :unsubmitted
      end

      if @study_iteration.update(revokation_params)
        flash[:success] = "Revoked study iteration \"#{@study_iteration.name}\""
      else
        flash[:danger] = 'Failed revoking study iteration'
      end

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration, tab: 'actions')
    end

    private

    def study_iteration_params
      params.require(:study_iteration).permit(:name)
    end

    def study_range_params
      params.require(:study_range).permit(:start, :end, :comment)
    end

    def revokation_params
      params.require(:study_iteration).permit(:revokation_reason)
    end

    def load_si
      @study_iteration = StudyIteration.find(params[:study_iteration_id])
    end

    def check_has_ranges
      return if @study_iteration.study_ranges.any?

      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration),
                  flash: { danger: 'A minimum of one study range is required.' }
    end

    def check_si_is_editable
      load_si

      return if @study_iteration.unsubmitted?

      flash[:danger] =
        'This study iteration was already accepted or declined and cannot be changed anymore.'\
        ' Please create a new study iteration.'
      redirect_to edit_regional_admin_country_study_iteration_path(@country, @study_iteration)
    end

    def load_calendar_months
      return unless current_tab == :calendar

      @study_ranges = @study_iteration.study_ranges

      @months = if @study_ranges.any?
                  CalendarUtil.collect_months(@study_ranges.first.start, @study_ranges.last.end)
                else
                  []
                end
    end
  end
end
