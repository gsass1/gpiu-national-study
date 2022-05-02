# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixMicrobiologicalInformation, type: :model do
  subject { microbiological_information }

  let(:microbiological_information) do
    described_class.new(
      proven: 'no',
      culture_antibiotics: 'no'
    )
  end

  it { is_expected.to be_valid }

  it 'needs proven' do
    microbiological_information.proven = nil
    expect(microbiological_information).to be_invalid
  end

  it 'need to specify culture tissue' do
    microbiological_information.proven = 'yes'
    expect(microbiological_information).to be_invalid

    microbiological_information.culture_tissue_urine = true
    expect(microbiological_information).to be_valid
  end

  it 'needs to specify if culture tissue is Other' do
    microbiological_information.proven = 'yes'
    microbiological_information.culture_tissue_other = true
    expect(microbiological_information).to be_invalid

    microbiological_information.culture_tissue_other_specify = 'Hi'
    expect(microbiological_information).to be_valid
  end

  it 'needs culture antibiotics' do
    microbiological_information.culture_antibiotics = nil
    expect(microbiological_information).to be_invalid
  end
end
