# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }

    let(:user) { nil }

    context 'when is a normal user' do
      let(:user) { create(:user) }

      describe 'ability to create departments' do
        context 'when hospital is approved' do
          context 'when not in same country' do
            let(:hospital) { FactoryBot.create(:hospital) }

            it { is_expected.not_to be_able_to(:create, hospital.departments.new) }
          end

          context 'when in same country' do
            let(:hospital) { FactoryBot.create(:hospital, country: user.country) }

            it { is_expected.to be_able_to(:create, hospital.departments.new) }
          end
        end

        context 'when hospital is pending' do
          let(:hospital) { FactoryBot.create(:hospital, acceptance_state: :pending, country: user.country) }

          it { is_expected.not_to be_able_to(:create, hospital.departments.new) }
        end

        context 'when hospital is rejected' do
          let(:hospital) { FactoryBot.create(:hospital, acceptance_state: :rejected, country: user.country) }

          it { is_expected.not_to be_able_to(:create, hospital.departments.new) }
        end
      end
    end
  end
end
