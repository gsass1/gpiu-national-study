require 'rails_helper'

RSpec.describe SupportRequestsController, type: :controller do
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  describe 'GET #new' do
    it_behaves_like 'a protected route', :new
  end

  describe 'POST #create' do
    let(:create_support_request) {
      post :create,
      params: {
        support_request: {
          email: user.email,
          support_type: :site_help,
          message: 'Help!'
        }
      }
    }

    it 'creates a support request' do
      expect { create_support_request }.to change(SupportRequest, :count).by(1)
    end

    it 'assigns user ID' do
      create_support_request

      expect(SupportRequest.last.user_id).to eq(user.id)
    end
  end
end
