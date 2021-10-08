# frozen_string_literal: true

class EmployeesController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  def create
    @employee.user_id = current_user.id

    if @employee.save
      flash.notice = "You checked into #{@employee.department.name}"
    else
      flash.alert = 'Unable to check into department.'
    end

    redirect_back fallback_location: root_url
  end

  def destroy
    flash.notice = if @employee.destroy
                     'Successfully checked out of department.'
                   else
                     'Unable to check out of department.'
                   end

    redirect_back fallback_location: root_url
  end

  private

  def employee_params
    params.require(:employee).permit(:department_id)
  end
end
