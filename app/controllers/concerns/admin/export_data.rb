# frozen_string_literal: true

module Admin
  module ExportData
    extend ActiveSupport::Concern

    protected

    def export_study_iteration
      return false unless UserPolicy.new(current_user).can_export_data?(@study_iteration)

      svc = ExportDataService.new(@study_iteration, params[:type_of_data])
      csv_data = svc.call

      if csv_data
        send_data csv_data, filename: svc.filename
        return true
      end

      flash[:danger] = 'Unable to export data.'
      false
    end
  end
end
