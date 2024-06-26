# frozen_string_literal: true

module Hospitals
  class CreateService < BaseService
    def initialize(user, hospital)
      @user = user
      @hospital = hospital
    end

    def call
      save_hospital

      return false unless @hospital.persisted?

      create_approval_notification
    end

    private

    def save_hospital
      @hospital.user_id = @user.id
      @hospital.save
    end

    def create_approval_notification
      User.with_role(:regional_admin, @hospital.country).each do |user|
        Notifier.notify(recipient: user, actor: @user, notifiable: @hospital, action: 'hospitals.submission')
      end
    end
  end
end
