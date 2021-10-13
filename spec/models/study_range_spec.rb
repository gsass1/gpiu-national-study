require 'rails_helper'

RSpec.describe StudyRange do
  let(:study_iteration) { create(:study_iteration) }
  subject { study_iteration.study_ranges.build }

  context 'in the past' do
    before(:each) do
      subject.start = 10.days.ago
      subject.end = 5.days.ago
    end

    it 'should have passed' do
      expect(subject.passed?)
    end

    it 'should not be active' do
      expect(!subject.active?)
    end
  end

  context 'in the future' do
    before(:each) do
      subject.start = 5.days.from_now
      subject.end = 10.days.from_now
    end

    it 'should be pending' do
      expect(subject.pending?)
    end

    it 'should not be active' do
      expect(!subject.active?)
    end
  end

  context 'in the present' do
    it 'cannot start inside start threshold' do
      subject.start = 11.days.from_now
      subject.end = 30.days.from_now
      expect(subject).to_not be_valid
    end

    it 'can start after the start treshold' do
      subject.start = 15.days.from_now
      subject.end = 30.days.from_now
      expect(subject).to be_valid
    end
  end

  context 'multiple study ranges' do
    it 'cannot overlap' do
      study_iteration.study_ranges.create(start: 15.days.from_now, end: 20.days.from_now)
      subject.start = 15.days.from_now
      subject.end = 30.days.from_now
      expect(subject).to_not be_valid
    end
  end
end
