require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  it_behaves_like 'a protected route', :index
end
