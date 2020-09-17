module AdminResource
  extend ActiveSupport::Concern

  included do
    attr_accessor :admin_table_fields
  end
end
