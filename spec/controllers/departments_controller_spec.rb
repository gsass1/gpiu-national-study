# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:user) { create(:user) }

  let(:some_hospital) { create(:hospital) }
  let(:national_hospital) { create(:hospital, country: user.country) }
  let(:own_hospital) { create(:hospital, country: user.country, user: user) }

  before { sign_in(user) }

  describe 'GET #new' do
    it 'is a protected route' do
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(:ok)

      sign_out(user)
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(:found)
    end

    it 'works for your own hospital' do
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(:ok)
    end

    it 'does not work for a hospital of another country' do
      expect do
        get :new, params: { hospital_id: some_hospital.id }
      end.to raise_error(CanCan::AccessDenied)
    end

    it 'works for any national hospital' do
      get :new, params: { hospital_id: national_hospital.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'owned hospital' do
      it 'creates a new department' do
        expect do
          post(:create, params: {
                 hospital_id: own_hospital.id,
                 department: {
                   name: 'Some Department'
                 }
               })
        end.to change(Department, :count).by(1)
      end
    end

    context 'national hospital' do
      it 'creates a new department' do
        expect do
          post(:create, params: {
                 hospital_id: national_hospital.id,
                 department: {
                   name: 'Some Department'
                 }
               })
        end.to change(Department, :count).by(1)
      end
    end

    context 'foreign hospital' do
      it 'does not create a new department' do
        expect do
          post(:create, params: {
                 hospital_id: some_hospital.id,
                 department: {
                   name: 'Some Department'
                 }
               })
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
