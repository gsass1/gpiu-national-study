# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Hospitals' do
  it_behaves_like 'admin resource', resource_class: Hospital
end
