# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe PatientIdentification do
  subject { create(:patient_identification) }

  describe 'validation' do
    describe 'admission_date' do
      context 'when in the future' do
        before do
          subject.admission_date = 10.days.from_now
        end

        it { is_expected.not_to be_valid }
      end

      context 'when in the past' do
        before do
          subject.admission_date = 1.day.ago
        end

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'sanitization' do
    describe 'pregnancy' do
      before do
        subject.update(sex: :female, pregnancy: true)
      end

      it 'is sanitized if sex set to male' do
        subject.update(sex: :male)
        expect(subject.reload.pregnancy).to be_nil
      end
    end

    describe 'evidence infection' do
      before do
        subject.update(evidence_infection: true, admission_infection: :home)
      end

      it 'sanitizes admission infection if set to false' do
        subject.update(evidence_infection: false)
        expect(subject.reload.admission_infection).to be_nil
      end
    end
  end
end
