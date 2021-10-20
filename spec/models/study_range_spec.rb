# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudyRange do
  subject { study_iteration.study_ranges.build }

  let(:study_iteration) { create(:study_iteration) }

  context 'in the past' do
    before do
      subject.start = 10.days.ago
      subject.end = 5.days.ago
    end

    it 'has passed' do
      expect(subject.passed?)
    end

    it 'is not active' do
      expect(!subject.active?)
    end
  end

  context 'in the future' do
    before do
      subject.start = 5.days.from_now
      subject.end = 10.days.from_now
    end

    it 'is pending' do
      expect(subject.pending?)
    end

    it 'is not active' do
      expect(!subject.active?)
    end
  end

  context 'in the present' do
    it 'cannot start inside start threshold' do
      subject.start = 11.days.from_now
      subject.end = 30.days.from_now
      expect(subject).not_to be_valid
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
      expect(subject).not_to be_valid
    end
  end
end
