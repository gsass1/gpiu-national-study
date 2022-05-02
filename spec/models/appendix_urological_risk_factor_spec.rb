# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixUrologicalRiskFactor, type: :model do
  subject { risk_factor }

  let(:risk_factor) do
    described_class.new(
      previous: false,
      tract_obstruction: false,
      urinarystones: 'no',
      antibiotic_treatment: 'no',
      hospitalisation: false,
      catheter: 'no'
    )
  end

  it { is_expected.to be_valid }

  it 'needs Previous UTI/SSI' do
    risk_factor.previous = nil
    expect(risk_factor).not_to be_valid
  end

  it 'needs tract obstruction' do
    risk_factor.tract_obstruction = nil
    expect(risk_factor).not_to be_valid
  end

  it 'needs at least one tract obstruction if chosen' do
    risk_factor.tract_obstruction = true
    expect(risk_factor).not_to be_valid

    risk_factor.bladder_outlet_obstruction = true
    expect(risk_factor).to be_valid
  end

  it 'needs urinary stones' do
    risk_factor.urinarystones = nil
    expect(risk_factor).not_to be_valid
  end

  it 'needs urinary stone location' do
    risk_factor.urinarystones = 'yes'

    risk_factor.urinarystones_calyceal = false
    risk_factor.urinarystones_renalpelvic = false
    risk_factor.urinarystones_ureteral = false
    risk_factor.urinarystones_bladder = false
    expect(risk_factor).not_to be_valid
    expect(risk_factor.errors[:urinarystones]).to be_present

    risk_factor.urinarystones_calyceal = true
    expect(risk_factor).to be_valid
  end

  it 'needs antibiotic treatment' do
    risk_factor.antibiotic_treatment = nil
    expect(risk_factor).not_to be_valid

    risk_factor.antibiotic_treatment = 'yes'
    expect(risk_factor).not_to be_valid

    risk_factor.antibiotic_treatment_type = 'uti'
    expect(risk_factor).to be_valid
  end

  it 'needs hospitalisation' do
    risk_factor.hospitalisation = nil
    expect(risk_factor).not_to be_valid
  end

  it 'hospitalisation specification gets sanitized' do
    risk_factor.hospitalisation = true
    risk_factor.hospitalisation_specify = 'Test'
    expect(risk_factor).to be_valid

    risk_factor.hospitalisation = false
    expect(risk_factor).to be_valid
    expect(risk_factor.hospitalisation_specify).to be_nil
  end

  it 'needs catheter' do
    risk_factor.catheter = nil
    expect(risk_factor).not_to be_valid
  end

  it 'needs at least one catheter location and duration' do
    risk_factor.catheter = 'yes'
    expect(risk_factor).not_to be_valid

    risk_factor.catheter_urethral = true
    risk_factor.catheterduration = 10
    expect(risk_factor).to be_valid
  end

  it 'needs specification if other catheter chosen' do
    risk_factor.catheter = 'yes'
    risk_factor.catheter_others = true
    risk_factor.catheterduration = 10

    expect(risk_factor).not_to be_valid

    risk_factor.catheter_other_specify = 'Somewhere'
    expect(risk_factor).to be_valid
  end

  it 'sanitize catheter duration' do
    risk_factor.catheter = 'yes'
    risk_factor.catheter_urethral = true
    risk_factor.catheterduration = 10
    expect(risk_factor).to be_valid

    risk_factor.catheter = 'no'
    risk_factor.valid?
    expect(risk_factor.catheterduration).to eq(0)

    risk_factor.catheter = 'unknown'
    risk_factor.valid?
    expect(risk_factor.catheterduration).to be_nil
  end
end
