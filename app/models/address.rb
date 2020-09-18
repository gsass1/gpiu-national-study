class Address < ApplicationRecord
  include Discard::Model

  has_one :hospital

  validates :city, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true

  def to_s
    "#{street}, #{zip_code} #{city}"
  end
end
