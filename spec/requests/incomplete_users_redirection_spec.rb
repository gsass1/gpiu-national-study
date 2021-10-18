require 'rails_helper'

RSpec.describe 'Incomplete Users Redirection', type: :request do
  it 'it does not redirect people that are not logged in' do
    get root_path
    expect(response).to have_http_status(200)
  end

  let(:user) { create(:user) }

  it 'it does not redirect people that have completed registration' do
    sign_in user
    get dashboard_index_path
    expect(response).to have_http_status(200)
  end

  let(:external_user) { create(:user, :registered_through_keycloak) }

  it 'it does redirect people that have not completed registration' do
    sign_in external_user 
    get dashboard_index_path
    expect(response).to redirect_to(finish_registration_path)
  end
end
