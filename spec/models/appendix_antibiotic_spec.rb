require 'rails_helper'

RSpec.describe AppendixAntibiotic, type: :model do
  subject { create(:appendix_antibiotic) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  shared_examples 'an antibiotic group' do |group:|
    enum_values = AppendixAntibiotic::send(group.to_s.pluralize)
    enum_values.each do |antibiotic, value|
      context 'when a group and an antibiotic are checked' do
        before do
          subject.send("#{group}_group=", true)
          subject.send("#{group}=", antibiotic)
          subject.save
        end

        it 'should save the antibiotic' do
          expect(subject.reload.send("#{group}")).to eq(antibiotic)
        end

        context 'when the group is unchecked' do
          before do
            subject.send("#{group}_group=", false)
            subject.save
          end

          it 'should sanitize the antibiotic' do
            expect(subject.reload.send("#{group}")).to eq(nil)
          end
        end
      end
    end
  end

  AppendixAntibiotic::GROUPS.each do |group|
    it_behaves_like 'an antibiotic group', group: group
  end
end
