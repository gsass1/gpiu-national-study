# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cookie Banner' do
  before do
    allow(GPIU).to receive(:enable_cookie_banner?).and_return(true)
  end

  context 'when not accepted' do
    before do
      visit root_path
    end

    it 'shows the cookie banner' do
      expect(page).to have_selector('.cookie-banner')
    end

    context 'when button is clicked' do
      before do
        within '.cookie-banner' do
          find('.btn').click
        end
      end

      it 'removes the cookie banner' do
        expect(page).not_to have_selector('.cookie-banner')
      end

      it 'banner does not appear again on next visit' do
        visit root_path
        expect(page).not_to have_selector('.cookie-banner')
      end
    end
  end
end
