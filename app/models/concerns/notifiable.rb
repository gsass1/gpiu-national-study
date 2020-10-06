module Notifiable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :notification_attr_proc

    # NOTE(gian): I18n notification messages only get the attributes of the
    # notification object as keys. But sometimes you wanna add more attributes.
    # For instance normally you would be able to only access country_id in the
    # notification message. This actually lets you evaluate custom attributes
    # whenever the notification is displayed. This keeps the notification views
    # clean.
    #
    # Usage:
    #
    # notify_with Proc.new { |f| { country_name: f.country.name } }
    def notify_with(attr_proc)
      self.notification_attr_proc = attr_proc
    end
  end
end
