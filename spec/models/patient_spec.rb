# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudyIteration do
  subject { patient }

  let(:patient) { create(:patient) }

  it 'validates initial' do
    patient.initial = nil
    expect(patient).not_to be_valid

    patient.initial = '   '
    expect(patient).not_to be_valid

    patient.initial = 'ABC'
    expect(patient).to be_valid
  end
end
