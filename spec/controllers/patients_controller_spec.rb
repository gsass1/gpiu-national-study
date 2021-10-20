# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  include_context 'within study iteration'
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    context 'in employed department' do
      it 'creates a new patient' do
        expect do
          post(:create, params: {
                 hospital_id: department.hospital.id,
                 department_id: department.id,
                 patient: {
                   initial: '1337',
                   department_id: department.id,
                   patient_type: 'uti_ssi'
                 }
               })
        end.to change(Patient, :count).by(1)
      end
    end

    context 'in unemployed department' do
      it 'does not create a new patient' do
        other_department = create(:department, hospital: hospital)

        expect do
          post(:create, params: {
                 hospital_id: other_department.hospital.id,
                 department_id: other_department.id,
                 patient: {
                   initial: '1337',
                   department_id: other_department.id,
                   patient_type: 'uti_ssi'
                 }
               })
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
