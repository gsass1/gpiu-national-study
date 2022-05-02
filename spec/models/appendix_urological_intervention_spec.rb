# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixUrologicalIntervention, type: :model do
  subject { urological_intervention }

  let(:urological_intervention) do
    described_class.new(
      performed_uti: 'yes',
      contamination_uti: 'clean',
      contamination_ssi: 'clean'
    )
  end

  shared_examples 'intervention category' do |type:, category:, can_specify:|
    describe category do
      it 'need specification' do
        urological_intervention.send("intervention_#{category}_#{type}=", true)
        expect(urological_intervention).to be_invalid

        urological_intervention.send("#{category}_#{type}=", 2)
        expect(urological_intervention).to be_valid
      end

      if can_specify
        it 'other needs specification' do
          urological_intervention.send("intervention_#{category}_#{type}=", true)
          urological_intervention.send("#{category}_#{type}=", 1) # 1 = other
          expect(urological_intervention).to be_invalid

          urological_intervention.send("#{category}_specify_#{type}=", "something")
          expect(urological_intervention).to be_valid
        end
      end

      it 'selecting and unselecting category cleans interventions' do
        urological_intervention.send("intervention_#{category}_#{type}=", true)
        urological_intervention.send("#{category}_#{type}=", 2)

        expect(urological_intervention).to be_valid
        urological_intervention.send("intervention_#{category}_#{type}=", false)
        expect(urological_intervention).to be_valid

        expect(urological_intervention.send("#{category}_#{type}")).to be_zero
      end
    end
  end

  shared_examples 'handles intervention specification' do |type:|
    it_behaves_like 'intervention category', type: type, category: 'endoscopic', can_specify: true
    it_behaves_like 'intervention category', type: type, category: 'percutaneous', can_specify: true
    it_behaves_like 'intervention category', type: type, category: 'laparoscopic', can_specify: true
    it_behaves_like 'intervention category', type: type, category: 'open_surgery', can_specify: true
    it_behaves_like 'intervention category', type: type, category: 'prostate_biopsy', can_specify: true
    it_behaves_like 'intervention category', type: type, category: 'others', can_specify: false
  end

  describe 'uti' do
    before do
      allow(urological_intervention).to receive(:uti_form_needed?).and_return(true)
      allow(urological_intervention).to receive(:ssi_form_needed?).and_return(false)
    end

    it { is_expected.to be_valid }

    it_behaves_like 'handles intervention specification', type: 'uti'

    it 'needs performed' do
      urological_intervention.performed_uti = nil
      expect(urological_intervention).to be_invalid
    end

    it 'needs contamination status' do
      urological_intervention.performed_uti = 'yes'
      urological_intervention.contamination_uti = nil
      expect(urological_intervention).to be_invalid
    end

    it 'sanitizes if not performed' do
      urological_intervention.performed_uti = 'no'
      urological_intervention.contamination_uti = :clean_contaminated

      expect(urological_intervention).to be_valid
      expect(urological_intervention.contamination_uti).to be_nil
    end
  end

  describe 'ssi' do
    before do
      allow(urological_intervention).to receive(:uti_form_needed?).and_return(false)
      allow(urological_intervention).to receive(:ssi_form_needed?).and_return(true)
    end

    it { is_expected.to be_valid }

    it_behaves_like 'handles intervention specification', type: 'ssi'

    it 'needs contamination status' do
      urological_intervention.contamination_ssi = nil
      expect(urological_intervention).to be_invalid
    end
  end
end
