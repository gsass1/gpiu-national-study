# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixCultureResult do
  let(:appendix_culture) { AppendixCultureResult.new(pos_id: 0) }
  subject { appendix_culture }

  it { is_expected.to be_valid }

  describe 'validation' do
    before do
      allow(appendix_culture).to receive(:new_record?).and_return(false)
    end

    it { is_expected.to be_invalid }

    it 'needs susceptibility standard' do
      appendix_culture.susceptibility_standard = :din
      expect(appendix_culture).to be_valid
    end

    it 'needs susceptibility standard specification' do
      appendix_culture.susceptibility_standard = :other
      expect(appendix_culture).to be_invalid

      appendix_culture.susceptibility_standard_other_specify = 'Blahblah'
      expect(appendix_culture).to be_valid
    end
  end
end
