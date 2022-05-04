# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Create study iteration' do
  let(:user) { create(:regional_admin) }

  before do
    sign_in(user)
  end

  it 'can create a new study iteration' do
    visit new_regional_admin_country_study_iteration_path(user.country)

    fill_in 'Name', with: 'My Study Iteration'
    click_button 'Create'

    expect(page).to have_content('Created study iteration with name "My Study Iteration"')
  end

  it 'notifies the global admins' do
    visit new_regional_admin_country_study_iteration_path(user.country)

    fill_in 'Name', with: 'My Study Iteration'
    click_button 'Create'

    expect(page).to have_content('Created study iteration with name "My Study Iteration"')
  end
end
