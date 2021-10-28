# frozen_string_literal: true

require 'rails_helper'

# TODO: test edit and deletion (if regional admin has permissions for it)
RSpec.shared_examples_for 'regional admin resource' do |resource_class:|
  include_context 'with regional admin user'

  describe 'index' do
    context 'when logged in as regional admin' do
      it 'shows all resources' do
        10.times do
          create(resource_class.name.underscore, country: country)
        end

        visit index_path(resource_class, country)
        expect(page).to have_css('table tr', count: 11)
        expect(page).to have_content("Displaying #{resource_class.name.pluralize} 1 - 10")
      end
    end

    context 'when logged in as normal user' do
      before do
        sign_in(create(:user))
      end

      it 'redirects' do
        visit index_path(resource_class, country)
        expect(page).to have_content('You are not a regional admin for this country')
      end
    end
  end

  describe 'show' do
    let(:resource) { create(resource_class.name.underscore, country: country) }

    context 'when logged in as admin' do
      it 'shows the resource' do
        visit show_path(resource_class, country, resource)
        expect(page).to have_content(resource.to_s)
      end

      if resource_class.included_modules.include?(CsvCollection)
        it 'can be downloaded as CSV' do
          visit show_path(resource_class, country, resource)
          click_link 'Export'

          wait_for_download
          expect(downloads.length).to eq(1)
        end
      end
    end

    context 'when logged in as normal user' do
      before do
        sign_in(create(:user))
      end

      it 'redirects' do
        visit show_path(resource_class, country, resource)
        expect(page).to have_content('You are not a regional admin for this country')
      end
    end
  end

  def index_path(resource_class, country)
    send("regional_admin_country_#{resource_class.name.underscore.pluralize}_path", country) 
  end

  def show_path(resource_class, country, resource)
    send("regional_admin_country_#{resource_class.name.underscore}_path", country, resource.id)
  end
end
