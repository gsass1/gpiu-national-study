# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SupportRequest do
  let(:support_request) { create(:support_request) }

  it 'is valid' do
    expect(support_request.valid?)
  end

  it 'requires an user' do
    support_request.user_id = nil
    expect(!support_request.valid?)
  end

  it 'requires a valid email' do
    support_request.email = 'not_an_email'
    expect(!support_request.valid?)
  end

  it 'requires a message' do
    support_request.message = nil
    expect(!support_request.valid?)
  end

  it 'requires a valid support type' do
    expect do
      support_request.support_type = :not_a_support_type
    end.to raise_error(ArgumentError)
  end

  describe 'custom support types' do
    it 'need the other_reason? support type' do
      support_request.support_type = :other_reason
      expect(!support_request.valid?)

      support_request.custom_support_type = 'Help'
      expect(support_request.valid?)
    end
  end
end
