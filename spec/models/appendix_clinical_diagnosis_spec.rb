# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixClinicalDiagnosis, type: :model do
  subject { clinical_diagnosis }

  let(:clinical_diagnosis) do
    described_class.new(
      diagnosis_date_uti: Date.today,
      diagnosis_date_ssi: Date.today,
      diagnosis_uti: 'asymptomatic_bacteriuria',
      diagnosis_ssi: 'asymptomatic_bacteriuria',
      cdc_uti_asymptomatic_bact_cath: true
    )
  end

  describe 'uti' do
    before do
      allow(clinical_diagnosis).to receive(:uti_form_needed?).and_return(true)
      allow(clinical_diagnosis).to receive(:ssi_form_needed?).and_return(false)
    end

    it { is_expected.to be_valid }

    it 'needs diagnosis date' do
      clinical_diagnosis.diagnosis_date_uti = nil
      expect(clinical_diagnosis).to be_invalid
    end

    it 'diagnosis date cannot be in the future' do
      clinical_diagnosis.diagnosis_date_uti = 10.days.from_now
      expect(clinical_diagnosis).to be_invalid
    end

    it 'needs diagnosis' do
      clinical_diagnosis.diagnosis_uti = nil
      expect(clinical_diagnosis).to be_invalid
    end

    it 'needs specification if other diagnosis chosen' do
      clinical_diagnosis.diagnosis_uti = 'other'
      expect(clinical_diagnosis).to be_invalid

      clinical_diagnosis.diagnosis_specify_uti = 'Specification'
      expect(clinical_diagnosis).to be_valid
    end

    it 'sanitizes other specification if unselected' do
      clinical_diagnosis.diagnosis_uti = 'other'
      clinical_diagnosis.diagnosis_specify_uti = 'Specification'

      expect(clinical_diagnosis).to be_valid
      clinical_diagnosis.diagnosis_uti = 'asymptomatic_bacteriuria'

      expect(clinical_diagnosis).to be_valid
      expect(clinical_diagnosis.diagnosis_specify_uti).to be_nil
    end

    it 'needs CDC specification' do
      clinical_diagnosis.cdc_uti_asymptomatic_bact_cath = false
      expect(clinical_diagnosis).to be_invalid
    end

    it 'sanitizes CDC specification' do
      clinical_diagnosis.cdc_uti_other = true
      clinical_diagnosis.cdc_uti_other_specify = 'Test'
      expect(clinical_diagnosis).to be_valid

      clinical_diagnosis.cdc_uti_other = false
      clinical_diagnosis.valid?
      expect(clinical_diagnosis.cdc_uti_other_specify).to be_nil
    end

    it 'cannot have both CDC definitions of asymptomatic bacteriuria at the same time' do
      clinical_diagnosis.cdc_uti_asymptomatic_bact_cath = true
      clinical_diagnosis.cdc_uti_asymptomatic_bact_nocatch = true
      expect(clinical_diagnosis).to be_invalid
    end
  end

  describe 'ssi' do
    before do
      allow(clinical_diagnosis).to receive(:uti_form_needed?).and_return(false)
      allow(clinical_diagnosis).to receive(:ssi_form_needed?).and_return(true)
    end

    it { is_expected.to be_valid }

    it 'needs diagnosis date' do
      clinical_diagnosis.diagnosis_date_ssi = nil
      expect(clinical_diagnosis).to be_invalid
    end

    it 'needs diagnosis' do
      clinical_diagnosis.diagnosis_ssi = nil
      expect(clinical_diagnosis).to be_invalid
    end

    it 'diagnosis date cannot be in the future' do
      clinical_diagnosis.diagnosis_date_ssi = 10.days.from_now
      expect(clinical_diagnosis).to be_invalid
    end

    it 'needs specification if other diagnosis chosen' do
      clinical_diagnosis.diagnosis_ssi = 'other'
      expect(clinical_diagnosis).to be_invalid

      clinical_diagnosis.diagnosis_specify_ssi = 'Specification'
      expect(clinical_diagnosis).to be_valid
    end

    it 'sanitizes other specification if unselected' do
      clinical_diagnosis.diagnosis_ssi = 'other'
      clinical_diagnosis.diagnosis_specify_ssi = 'Specification'

      expect(clinical_diagnosis).to be_valid
      clinical_diagnosis.diagnosis_ssi = 'asymptomatic_bacteriuria'

      expect(clinical_diagnosis).to be_valid
      expect(clinical_diagnosis.diagnosis_specify_ssi).to be_nil
    end
  end
end
