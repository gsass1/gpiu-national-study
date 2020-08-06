class Employee < ApplicationRecord
  include Discard::Model

  belongs_to :hospital
  belongs_to :user
end
