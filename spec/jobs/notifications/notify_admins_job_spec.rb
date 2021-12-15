# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notifications::NotifyAdminsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:actor) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:regional_admin) { create(:regional_admin) }

  let!(:hospital) { create(:hospital) }

  it 'creates notifications' do
    perform_enqueued_jobs do
      expect(Notifier).to receive(:notify).with(hash_including(actor: actor, recipient: admin, notifiable: hospital, action: 'hospitals.submission'))

      Notifications::NotifyAdminsJob.perform_now(notification: { actor: actor, notifiable: hospital, action: 'hospitals.submission' })
    end
  end
end
