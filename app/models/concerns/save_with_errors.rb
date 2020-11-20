module SaveWithErrors
  extend ActiveSupport::Concern

  def save_with_errors!(*args)
    save_without_errors! *args
  rescue ActiveRecord::RecordInvalid
    save_anyway
    raise # this re-raises the exception we just rescued
  end

  def save_with_errors(*args)
    save_without_errors *args or save_anyway
  end

  def self.included(receiver)
    receiver.alias_method :save_without_errors, :save
    receiver.alias_method :save, :save_with_errors

    receiver.alias_method :save_without_errors!, :save!
    receiver.alias_method :save!, :save_with_errors!
  end

private
  def save_anyway
    save(validate: false)
  end
end
