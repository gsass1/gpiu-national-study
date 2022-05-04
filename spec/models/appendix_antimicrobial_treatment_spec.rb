# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixAntimicrobialTreatment, type: :model do
  subject { antimicrobial_treatment }

  let(:antimicrobial_treatment) do
    described_class.new(
      treatment: 'none'
    )
  end

  it { is_expected.to be_valid }

  it 'needs treatment' do
    antimicrobial_treatment.treatment = nil
    expect(antimicrobial_treatment).to be_invalid
  end
end
