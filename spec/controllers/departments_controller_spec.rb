require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:user) { create(:user) }

  let(:some_hospital) { create(:hospital) }
  let(:national_hospital) { create(:hospital, country: user.country) }
  let(:own_hospital) { create(:hospital, country: user.country, user: user) }

  before(:each) { sign_in(user) }

  describe 'GET #new' do
    it 'is a protected route' do
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(200)

      sign_out(user)
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(302)
    end

    it 'works for your own hospital' do
      get :new, params: { hospital_id: own_hospital.id }
      expect(response).to have_http_status(200)
    end

    it 'does not work for a hospital of another country' do
      expect {
        get :new, params: { hospital_id: some_hospital.id }
      }.to raise_error(CanCan::AccessDenied)
    end

    it 'works for any national hospital' do
      get :new, params: { hospital_id: national_hospital.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'owned hospital' do
      it 'creates a new department' do
        expect {
          post(:create, params: {
            hospital_id: own_hospital.id,
            department: {
              name: 'Some Department'
            }
          })
        }.to change(Department, :count).by(1)
      end
    end

    context 'national hospital' do
      it 'creates a new department' do
        expect {
          post(:create, params: {
            hospital_id: national_hospital.id,
            department: {
              name: 'Some Department'
            }
          })
        }.to change(Department, :count).by(1)
      end
    end

    context 'foreign hospital' do
      it 'does not create a new department' do
        expect {
          post(:create, params: {
            hospital_id: some_hospital.id,
            department: {
              name: 'Some Department'
            }
          })
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
