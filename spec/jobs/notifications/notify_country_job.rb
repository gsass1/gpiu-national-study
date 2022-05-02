# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notifications::NotifyCountryJob, type: :job do
  include ActiveJob::TestHelper

  let!(:actor) { create(:user) }
  let!(:user) { create(:user) }
  let!(:hospital) { create(:hospital) }

  it 'creates notifications' do
    perform_enqueued_jobs do
      expect(Notifier).to receive(:notify).with(hash_including(actor: actor, recipient: user, notifiable: hospital,
                                                               action: 'hospitals.submission'))

      described_class.perform_now(country: user.country,
                                  notification: { actor: actor, notifiable: hospital,
                                                  action: 'hospitals.submission' })
    end
  end
end
