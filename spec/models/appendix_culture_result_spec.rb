# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixCultureResult do
  subject { create(:appendix_culture_result) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  describe 'validation' do
    %i[first second].each do |place|
      describe "#{place} pathogen: other bacteria" do
        before do
          subject.send("#{place}_pathogen=", 'Other bacteria')
          subject.send("#{place}_pathogen_enter_cfu_ml=", 1)
        end

        it 'requires specification' do
          expect(subject).not_to be_valid
          subject.send("#{place}_pathogen_specify=", 'Cool bacteria')
          expect(subject).to be_valid
        end
      end
    end
  end

  shared_examples 'a pathogen group' do |place:, group:|
    context "when the #{group[:field]} group is selected" do
      before do
        subject.send("#{place}_#{group[:field]}=", true)
      end

      it 'requires at least one antibiotic in that group' do
        expect(subject).not_to be_valid
        expect(subject.errors["#{place}_#{group[:field]}".to_sym]).not_to be_empty
      end

      group[:sub_fields].each do |field|
        context "when #{field[:field]} is selected" do
          before do
            subject.send("#{place}_#{field[:field]}=", true)
            subject.valid?
          end

          it 'removes the group error' do
            expect(subject.errors["#{place}_#{group[:field]}".to_sym]).to be_empty
          end

          it 'requires a sensitivity' do
            expect(subject.errors["#{place}_#{field[:field]}_s".to_sym]).not_to be_empty
          end

          context 'when a sensitivity is selected' do
            before do
              subject.send("#{place}_#{field[:field]}_s=".to_sym, 0)
            end

            it { is_expected.to be_valid }

            it 'is sanitized if the pathogen is unticked' do
              subject.send("#{place}_#{field[:field]}=", false)
              subject.save
              expect(subject.reload.send("#{place}_#{field[:field]}_s")).to be(nil)
            end

            it 'is sanitized if the pathogen group is unticked' do
              subject.send("#{place}_#{group[:field]}=", false)
              subject.save
              expect(subject.reload.send("#{place}_#{field[:field]}")).to be(nil)
              expect(subject.reload.send("#{place}_#{field[:field]}_s")).to be(nil)
            end
          end
        end
      end
    end
  end

  shared_examples 'a single pathogen' do |place:, field:|
    context "when #{field[:field]} is selected" do
      before do
        subject.send("#{place}_#{field[:field]}=", true)
        subject.valid?
      end

      it 'requires a sensitivity' do
        expect(subject.errors["#{place}_#{field[:field]}_s".to_sym]).not_to be_empty
      end

      context 'when a sensitivity is selected' do
        before do
          subject.send("#{place}_#{field[:field]}_s=".to_sym, 0)
        end

        it { is_expected.to be_valid }
      end
    end
  end

  AppendixCultureResult::SUSCEPTIBILITY_FIELDS.each do |group|
    if group.key?(:sub_fields)
      it_behaves_like 'a pathogen group', place: :first, group: group
      it_behaves_like 'a pathogen group', place: :second, group: group
    else
      it_behaves_like 'a single pathogen', place: :first, field: group
      it_behaves_like 'a single pathogen', place: :second, field: group
    end
  end
end
