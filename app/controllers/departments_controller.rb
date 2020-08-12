class DepartmentsController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  def new
    @department.hospital_id = params[:hospital_id]
  end

  def create
    if @department.save
      flash.notice = "Department was created."
      redirect_to @department
    else
      p @department.errors.full_messages
      render :new
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :hospital_id)
  end
end
