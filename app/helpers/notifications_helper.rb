module NotificationsHelper
  def notifiable_attributes(notifiable)
    attrs = {}

    # Merge the notifiable object itself as an attribute for the message. This is useful sometimes.
    attrs.merge! notifiable.attributes.merge(notifiable: notifiable)

    if notifiable.class.included_modules.include?(Notifiable)
      attrs.merge! notifiable.class.notification_attr_proc.call(notifiable)
    end

    attrs
  end
end
