# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admin > Resources > Hospitals' do
  it_behaves_like 'regional admin resource', resource_class: Hospital
end
