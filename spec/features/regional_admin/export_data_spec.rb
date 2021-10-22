# frozen_string_literal: true

require 'rails_helper'
require 'csv'

RSpec.describe 'Regional Admins > Export data' do
  include DownloadHelpers

  include_context 'within study iteration'
  let(:user) { create(:regional_admin) }

  before do
    travel 100.days # Pass the study iteration
    sign_in(user)

    #allow(Department).to receive(:as_csv_collection).and_return('1,2,3,4')
  end

  shared_examples 'cannot export data' do
    it do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      expect(page).not_to have_link('Hospital data (CSV)')
    end
  end

  context 'when export permission not granted yet' do
    before do
      study_iteration.update(exportable: false)
    end

    it_behaves_like 'cannot export data'
  end

  shared_examples 'a download link' do
    it 'downloads a file' do
      expect(downloads.length).to eq(1)
    end

    it 'is a CSV file' do
      expect {
        CSV.read(download)
      }.not_to raise_error
    end
  end

  context 'when permission is granted' do
    before do
      study_iteration.update(exportable: true)
    end

    it 'shows download links' do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      expect(page).to have_link('Hospital data (CSV)')
    end

    context 'when hospital data is downloaded' do
      before do
        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
        click_link 'Hospital data (CSV)'
        wait_for_download
      end

      it_behaves_like 'a download link'
    end

    context 'when UTI/SSI data is downloaded' do
      before do
        create(:patient, :uti_ssi, department: department, study_iteration: study_iteration)

        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
        click_link 'UTI/SSI Patients (CSV)'
        wait_for_download
      end

      it_behaves_like 'a download link'
    end

    context 'when Prostate Biopsy data is downloaded' do
      before do
        create(:patient, :prostate_biopsy, department: department, study_iteration: study_iteration)

        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
        click_link 'Prostate Biopsy Patients (CSV)'
        wait_for_download
      end

      it_behaves_like 'a download link'
    end
  end
end
