# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'with SSO', shared_context: :metadata do
  before do
    allow(Keycloak).to receive(:enabled?).and_return(true)
    allow(Keycloak).to receive(:host).and_return('keycloak.local')
    allow_any_instance_of(ApplicationHelper).to receive(:keycloak_authorize_path).and_return('not important')
    Rails.application.reload_routes!
  end
end
