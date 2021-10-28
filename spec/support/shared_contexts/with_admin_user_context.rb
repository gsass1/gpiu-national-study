# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'with admin user', shared_context: :metadata do
  let!(:admin_user) { create(:admin) }

  before do
    sign_in(admin_user)
  end
end

RSpec.shared_context 'with regional admin user', shared_context: :metadata do
  let!(:country) { create(:country) }
  let!(:regional_admin_user) { create(:regional_admin, country: country) }

  before do
    sign_in(regional_admin_user)
  end
end
