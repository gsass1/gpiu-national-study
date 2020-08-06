class Hospital < ApplicationRecord
  include Discard::Model

  belongs_to :country
  has_one :address, dependent: :destroy
end
