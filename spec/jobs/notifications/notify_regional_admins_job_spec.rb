# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notifications::NotifyRegionalAdminsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:actor) { create(:user) }
  let!(:regional_admin) { create(:regional_admin) }
  let!(:admin) { create(:admin) }

  let!(:hospital) { create(:hospital) }

  it 'creates notifications' do
    perform_enqueued_jobs do
      expect(Notifier).to receive(:notify).with(hash_including(actor: actor, recipient: regional_admin, notifiable: hospital, action: 'hospitals.submission'))

      Notifications::NotifyRegionalAdminsJob.perform_now(
        country: regional_admin.country,
        notification: { actor: actor, notifiable: hospital, action: 'hospitals.submission' }
      )
    end
  end
end
