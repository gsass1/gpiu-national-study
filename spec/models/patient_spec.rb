# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudyIteration do
  let(:patient) { create(:patient) }
  subject { patient }

  it 'validates initial' do
    patient.initial = nil
    expect(patient).to_not be_valid

    patient.initial = '   '
    expect(patient).to_not be_valid

    patient.initial = 'ABC'
    expect(patient).to be_valid
  end
end
