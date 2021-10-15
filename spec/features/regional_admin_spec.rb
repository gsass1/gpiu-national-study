require 'rails_helper'

RSpec.describe 'Regional Admins' do
  let(:user) { create(:regional_admin) }

  before do
    sign_in(user)
  end

  describe 'Hospital management' do
    let(:hospital) { create(:hospital, country: user.country, acceptance_state: :pending) }

    it 'can accept pending hospitals' do
      visit regional_admin_country_hospital_path(hospital.country.iso_2.upcase, hospital)
      expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user, action: 'hospitals.accepted', notifiable: hospital))

      click_link 'Accept'

      expect(Hospital.last.acceptance_state).to eq('approved')
    end

    it 'can reject pending hospitals' do
      visit regional_admin_country_hospital_path(hospital.country, hospital)
      expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user, action: 'hospitals.rejected', notifiable: hospital))

      click_link 'Reject'

      expect(Hospital.last.acceptance_state).to eq('rejected')
    end
  end

  describe 'Study Iteration management' do
    let(:study_iteration) { create(:study_iteration, country: user.country) }

    describe 'creation' do
      it 'can create new study iterations' do
        visit new_regional_admin_country_study_iteration_path(user.country)

        fill_in 'Name', with: 'My Study Iteration'
        click_button 'Create'

        expect(page).to have_content('Created study iteration with name "My Study Iteration"')
      end

      it 'can add valid study ranges' do
        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'schedule')

        select '2025', from: 'study_range[start(1i)]'
        select 'January', from: 'study_range[start(2i)]'
        select '1', from: 'study_range[start(3i)]'

        select '2026', from: 'study_range[end(1i)]'
        select 'January', from: 'study_range[end(2i)]'
        select '1', from: 'study_range[end(3i)]'

        click_button 'Add'
        expect(page).to have_content('2025-01-01')
        expect(page).to have_content('2026-01-01')
      end

      it 'cannot add invalid study ranges and shows the appropriate error message' do
        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'schedule')

        select '2020', from: 'study_range[start(1i)]'
        select 'January', from: 'study_range[start(2i)]'
        select '1', from: 'study_range[start(3i)]'

        select '2026', from: 'study_range[end(1i)]'
        select 'January', from: 'study_range[end(2i)]'
        select '1', from: 'study_range[end(3i)]'

        click_button 'Add'
        expect(page).to have_content('Please review the problems below:')
      end

      it 'can submit a valid study iteration', js: true do
        admin = create(:admin)
        study_iteration.study_ranges.create! start: 30.days.from_now, end: 60.days.from_now

        expect(Notifier).to receive(:notify).with(hash_including(recipient: admin, notifiable: study_iteration, action: 'study_iterations.submission'))

        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')

        accept_alert do
          click_link 'Submit'
        end

        expect(page).to have_content('Submitted for approval')
        expect(study_iteration.reload.acceptance_state).to eq('pending')
      end

      it 'cannot submit an invalid study iteration', js: true do
        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')

        expect(page).to have_button('Submit', disabled: true)
      end
    end

    describe 'data retrieval' do
      let(:study_iteration) { create(:study_iteration, country: user.country, acceptance_state: :accepted) }

      before do
        study_iteration.study_ranges.create! start: 30.days.from_now, end: 60.days.from_now
        travel 90.days
      end

      context 'no permission granted' do
        it 'cannot export data without permission' do
          visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

          expect(page).to have_content('Patient data will be exportable once you have been granted permission by an administrator.')
        end

        context 'when study iteration has passed' do
          before do
            travel 90.days
          end

          it 'can request data export permission' do
            admin = create(:admin)

            expect(study_iteration.passed?)

            visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

            expect(page).to have_content('Request Export Permission')

            expect(Notifier).to receive(:notify).with(hash_including(notifiable: study_iteration, recipient: admin, action: 'study_iterations.request_export_permission'))

            accept_alert do
              click_link 'Request'
            end
          end

          # it 'request data export has a cooldown' do
          #   admin = create(:admin)

          #   visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
          #   expect(Notifier).to receive(:notify).with(hash_including(notifiable: study_iteration, recipient: admin, action: 'study_iterations.request_export_permission'))

          #   accept_alert do
          #     click_link 'Request'
          #   end

          #   travel 5.minutes

          #   visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
          #   expect(Notifier).not_to receive(:notify)

          #   accept_alert do
          #     click_link 'Request'
          #   end
          # end
        end
      end
    end
  end
end
