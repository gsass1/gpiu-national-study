# frozen_string_literal: true

class StudyIteration < ApplicationRecord
  include Notifiable

  include StudyIterations::Approvable
  include StudyIterations::DataRequestable
  include StudyIterations::Departments
  include StudyIterations::Notification
  include StudyIterations::Schedulable

  belongs_to :country
  has_many :patients, dependent: :destroy

  validates :name, presence: true

  def to_s
    name
  end
end
