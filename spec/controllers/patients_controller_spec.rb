require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  include_context 'within study iteration'
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    context 'in employed department' do
      it 'should create a new patient' do
        expect {
          post(:create, params: {
            hospital_id: department.hospital.id,
            department_id: department.id,
            patient: {
              initial: '1337',
              department_id: department.id,
              patient_type: 'uti_ssi'
            }
          })
        }.to change(Patient, :count).by(1)
      end
    end

    context 'in unemployed department' do
      it 'should not create a new patient' do
        other_department = create(:department, hospital: hospital)

        expect {
          post(:create, params: {
            hospital_id: other_department.hospital.id,
            department_id: other_department.id,
            patient: {
              initial: '1337',
              department_id: other_department.id,
              patient_type: 'uti_ssi'
            }
          })
        }.to raise_error(CanCan::AccessDenied)
      end
    end

  end
end
