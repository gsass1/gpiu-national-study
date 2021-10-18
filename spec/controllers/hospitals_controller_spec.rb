require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
  render_views

  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

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
        expect(response.body).to_not include(hospital.name)
      end

      it 'hides rejected hospitals of the same country' do
        hospital = create(:hospital, country: user.country, acceptance_state: :rejected)

        get :index
        expect(response.body).to_not include(hospital.name)
      end

      it 'hides hospitals of other countres' do
        hospital = create(:hospital)

        get :index
        expect(response.body).to_not include(hospital.name)
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
    let(:post_hospital) {
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
    }

    context 'logged out' do
      before(:each) { sign_out(user) }

      it 'should not create hospital' do
        expect { post_hospital }.to_not change(Hospital, :count)
      end
    end

    context 'logged in' do
      it 'should create the hospital' do
        expect { post_hospital }.to change(Hospital, :count).by(1)
      end

      it 'should redirect to the hospital' do
        post_hospital
        expect(response).to redirect_to(Hospital.last)
      end

      it 'should assign user ID' do
        post_hospital
        expect(Hospital.last.user_id).to eq(user.id)
      end

      it 'should assign country' do
        post_hospital
        expect(Hospital.last.country).to eq(user.country)
      end

      it 'should set acceptance state to pending' do
        post_hospital
        expect(Hospital.last.acceptance_state).to eq('pending')
      end

      describe 'triggering notifications' do
        let(:regional_admin) { create(:regional_admin, country: user.country) }

        it 'should notify regional admins' do
          expect(User.with_role(:regional_admin, regional_admin.country)).to_not be_empty
          expect { post_hospital }.to change(Notification, :count).by(1)

          last_notification = Notification.last
          expect(last_notification.actor).to eq(user)
          expect(last_notification.recipient).to eq(regional_admin)
          expect(last_notification.action).to eq('hospitals.submission')
        end
      end
    end
  end
end
