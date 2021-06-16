require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  describe 'GET index' do
    before :each do
      get :index
    end

    subject { response }
    it { should have_http_status(200) }
  end
end
