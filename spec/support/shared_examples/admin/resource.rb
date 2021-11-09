# frozen_string_literal: true

require 'rails_helper'

# TODO: test discarding and creation if feasible
RSpec.shared_examples_for 'admin resource' do |resource_class:|
  include_context 'with admin user'
  let(:index_path) { send("admin_#{resource_class.name.underscore.pluralize}_path") }
  let(:new_path) { send("new_admin_#{resource_class.name.underscore}_path") }

  describe 'index' do
    context 'when logged in as admin' do
      it 'shows all resources' do
        10.times do
          create(resource_class.name.underscore)
        end

        visit index_path
        expect(page).to have_css('table tr', count: 11)
        expect(page).to have_content("Displaying #{resource_class.name.pluralize} 1 - 10")
      end

      if resource_class.included_modules.include?(CsvCollection)
        it 'can be downloaded as CSV' do
          create(resource_class.name.underscore)

          visit index_path
          click_link 'Export All'

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
        visit index_path
        expect(page).to have_content('You are not an admin')
      end
    end
  end

  describe 'show' do
    let(:resource) { create(resource_class.name.underscore) }
    let(:show_path) { send("admin_#{resource_class.name.underscore}_path", resource.id) }

    context 'when logged in as admin' do
      it 'shows the resource' do
        visit show_path
        expect(page).to have_content(resource.to_s)
      end

      if resource_class.included_modules.include?(CsvCollection)
        it 'can be downloaded as CSV' do
          visit show_path
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
        visit show_path
        expect(page).to have_content('You are not an admin')
      end
    end
  end

  describe 'edit' do
    let(:resource) { create(resource_class.name.underscore) }
    let(:edit_path) { send("edit_admin_#{resource_class.name.underscore}_path", resource.id) }

    context 'when logged in as admin' do
      it 'shows the resource' do
        visit edit_path
        expect(page).to have_content("Editing #{resource}")
      end

      it 'can update the resource' do
        visit edit_path

        # We cannot really change anything here, because we do not know
        # anything about the resource, so we will just click Update and see if
        # that works
        click_button 'Update'
        expect(page).to have_content('Resource was updated.')
      end
    end

    context 'when logged in as normal user' do
      before do
        sign_in(create(:user))
      end

      it 'redirects' do
        visit edit_path
        expect(page).to have_content('You are not an admin')
      end
    end
  end

  describe 'new' do
    context 'when logged in as admin' do
      it 'shows a form' do
        visit new_path

        expect(page).to have_content("New #{resource_class.name}")
      end
    end

    context 'when logged in as normal user' do
      before do
        sign_in(create(:user))
      end

      it 'redirects' do
        visit new_path
        expect(page).to have_content('You are not an admin')
      end
    end
  end
end
