# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Support Requests' do
  it_behaves_like 'admin resource', resource_class: SupportRequest
end
