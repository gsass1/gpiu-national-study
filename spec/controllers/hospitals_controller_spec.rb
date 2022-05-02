# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
  include ActiveJob::TestHelper
  render_views

  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    it_behaves_like 'a protected route', :index

    describe 'it shows hospitals' do
      it 'shows hospitals of the same country' do
        hospital = create(:hospital, country: user.country)

        get :index
        expect(response.body).to include(hospital.name)
      end

      it 'hides pending hospitals of the same country' do
        hospital = create(:hospital, country: user.country, acceptance_state: :pending)

        get :index
        expect(response.body).not_to include(hospital.name)
      end

      it 'hides rejected hospitals of the same country' do
        hospital = create(:hospital, country: user.country, acceptance_state: :declined)

        get :index
        expect(response.body).not_to include(hospital.name)
      end

      it 'hides hospitals of other countres' do
        hospital = create(:hospital)

        get :index
        expect(response.body).not_to include(hospital.name)
      end
    end
  end

  describe 'GET #show' do
    let(:get_hospital) { get :show, params: { id: hospital.id } }

    context 'hospital of own country' do
      let(:hospital) { create(:hospital, country: user.country) }

      it 'displays the hospital' do
        get_hospital
        expect(response.body).to include(hospital.name)
      end
    end

    context 'hospital of different country' do
      let(:hospital) { create(:hospital) }

      it 'displays the hospital' do
        expect { get_hospital }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'GET #new' do
    it_behaves_like 'a protected route', :new
  end

  describe 'POST #create' do
    let(:post_hospital) do
      post :create, params: {
        hospital: {
          name: 'My Hospital',
          first_department_name: 'Urology',
          address_attributes: {
            street: 'Street',
            zip_code: '12345',
            city: 'City'
          }
        }
      }
    end

    context 'logged out' do
      before { sign_out(user) }

      it 'does not create hospital' do
        expect { post_hospital }.not_to change(Hospital, :count)
      end
    end

    context 'logged in' do
      it 'creates the hospital' do
        expect { post_hospital }.to change(Hospital, :count).by(1)
      end

      it 'redirects to the hospital' do
        post_hospital
        expect(response).to redirect_to(Hospital.last)
      end

      it 'assigns user ID' do
        post_hospital
        expect(Hospital.last.user_id).to eq(user.id)
      end

      it 'assigns country' do
        post_hospital
        expect(Hospital.last.country).to eq(user.country)
      end

      it 'sets acceptance state to pending' do
        post_hospital
        expect(Hospital.last.acceptance_state).to eq('pending')
      end

      describe 'triggering notifications' do
        let!(:regional_admin) { create(:regional_admin, country: user.country) }

        it 'notifies regional admins' do
          perform_enqueued_jobs do
            expect(Notifier).to receive(:notify).with(hash_including(recipient: regional_admin,
                                                                     action: 'hospitals.submission'))

            post_hospital
          end
        end
      end
    end
  end
end
