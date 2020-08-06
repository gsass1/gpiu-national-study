class Address < ApplicationRecord
  include Discard::Model

  belongs_to :country
end
