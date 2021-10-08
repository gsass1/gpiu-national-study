class SupportRequestsController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  def new
    @support_request.email = current_user.email
  end

  def create
    @support_request = current_user.support_requests.build(support_request_params)
    if @support_request.save
      flash[:success] = 'Your support request was created.'
      redirect_to dashboard_index_path
    else
      p @support_request.errors.full_messages
      render :new
    end
  end

  private

  def support_request_params
    params.require(:support_request).permit(:email, :support_type, :custom_support_type, :message)
  end
end
