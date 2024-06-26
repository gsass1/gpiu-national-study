# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples_for 'a protected route' do |view, params: {}|
  it 'requires login' do
    sign_out user
    get view, **params
    expect(response).to redirect_to(new_user_session_path)

    sign_in user
    get view, **params
    expect(response).to have_http_status(:ok)
  end
end

RSpec.shared_examples_for 'an unprotected route' do |view, params: {}|
  it 'does not require login' do
    get view, **params
    expect(response).to have_http_status(:ok)
  end
end
