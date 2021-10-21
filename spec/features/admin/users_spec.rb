# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Users' do
  it_behaves_like 'admin resource', resource_class: User
end
