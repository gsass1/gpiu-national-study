require 'rails_helper'

RSpec.describe SusceptibilityTest, type: :model do
  let(:susceptibility_test) { SusceptibilityTest.new(pos_id: 0) }
  subject { susceptibility_test }

  it { is_expected.to be_valid }

  describe 'validation' do
    before do
      allow(susceptibility_test).to receive(:new_record?).and_return(false)
      susceptibility_test.pathogen = 'Enterobacteriaceae'
      susceptibility_test.cfu = '≥ 10^2'
    end

    it { is_expected.to be_valid }

    it 'needs pathogen' do
      susceptibility_test.pathogen = nil
      expect(susceptibility_test).to be_invalid
    end

    it 'needs pathogen specification' do
      susceptibility_test.pathogen = SusceptibilityTest::OTHER_PATHOGENS.first
      expect(susceptibility_test).to be_invalid

      susceptibility_test.pathogen_specify = 'My pathogen :)'
      expect(susceptibility_test).to be_valid
    end

    it 'needs cfu' do
      susceptibility_test.cfu = nil
      expect(susceptibility_test).to be_invalid
    end

    it 'selecting group without specifying any antibiotics should be invalid' do
      susceptibility_test.aminoglycosides = true
      expect(susceptibility_test).to be_invalid

      susceptibility_test.aminoglycosides_amikacin = true
      susceptibility_test.aminoglycosides_amikacin_s = 0
      expect(susceptibility_test).to be_valid
    end

    it 'antibiotic in group needs sensitivity' do
      susceptibility_test.aminoglycosides = true
      susceptibility_test.aminoglycosides_amikacin = true
      expect(susceptibility_test).to be_invalid

      susceptibility_test.aminoglycosides_amikacin_s = 0
      expect(susceptibility_test).to be_valid
    end

    it 'single antibiotic needs sensitivity' do
      susceptibility_test.trimethoprim = true
      expect(susceptibility_test).to be_invalid

      susceptibility_test.trimethoprim_s = 0
      expect(susceptibility_test).to be_valid
    end
  end

  describe 'sanitization' do
    it 'sanitizes sensitivity' do
      susceptibility_test.aminoglycosides = true
      susceptibility_test.aminoglycosides_amikacin = true
      susceptibility_test.aminoglycosides_amikacin_s = 0
      susceptibility_test.valid?

      susceptibility_test.aminoglycosides_amikacin = false
      susceptibility_test.valid?

      expect(susceptibility_test.aminoglycosides_amikacin_s).to be_nil
    end

    it 'sanitizes groups' do
      susceptibility_test.aminoglycosides = true
      susceptibility_test.aminoglycosides_amikacin = true
      susceptibility_test.aminoglycosides_amikacin_s = 0
      susceptibility_test.valid?

      susceptibility_test.aminoglycosides = false
      susceptibility_test.valid?

      expect(susceptibility_test.aminoglycosides_amikacin).to eq(false)
      expect(susceptibility_test.aminoglycosides_amikacin_s).to eq(nil)
    end
  end
end
