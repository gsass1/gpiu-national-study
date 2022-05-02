# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixComorbidity, type: :model do
  subject { comorbidity }

  let(:comorbidity) { create(:appendix_comorbidity) }

  it { is_expected.to be_valid }

  shared_examples 'severity level group' do |level:|
    context "when group #{level} is checked" do
      attribute = "severity_#{level}"

      before do
        comorbidity.send("#{attribute}=", true)
      end

      context 'when no severities were selected' do
        before do
          AppendixComorbidity::SEVERITY_LEVELS[level].each do |severity|
            comorbidity.send("#{severity}=", false)
          end
        end

        it { is_expected.not_to be_valid }

        it 'complains that no severity under that group was selected' do
          comorbidity.valid?
          expect(comorbidity.errors[attribute]).to be_present
        end
      end

      context 'when severities were selected' do
        before do
          AppendixComorbidity::SEVERITY_LEVELS[level].each do |severity|
            comorbidity.send("#{severity}=", true)
          end
        end

        it { is_expected.to be_valid }

        it 'sanitizes when group attribute was unchecked' do
          comorbidity.send("#{attribute}=", false)
          comorbidity.valid?

          AppendixComorbidity::SEVERITY_LEVELS[level].each do |severity|
            expect(comorbidity.send(severity.to_s)).to be_falsey
          end
        end
      end
    end
  end

  it_behaves_like 'severity level group', level: :one
  it_behaves_like 'severity level group', level: :two
  it_behaves_like 'severity level group', level: :three
  it_behaves_like 'severity level group', level: :four
end
