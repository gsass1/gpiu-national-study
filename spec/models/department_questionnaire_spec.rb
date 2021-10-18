require 'rails_helper'
require 'cancan/matchers'

RSpec.describe DepartmentQuestionnaire do
  subject { create(:department_questionnaire) }

  describe 'sanitization' do
    describe 'other hospital type' do
      before do
        subject.update(hospital_type: :other, hospital_othertype: 'Cool Hospital')
      end

      it 'should not sanitize hospital_othertype if hospital type is other' do
        expect(subject.reload.hospital_othertype).not_to be(nil)
      end

      it 'should sanitize hospital_othertype if hospital is not other type' do
        subject.update(hospital_type: :university)
        expect(subject.reload.hospital_othertype).to be(nil)
      end
    end
  end
end
