# frozen_string_literal: true

module Comorbidity
  extend ActiveSupport::Concern

  included do
    has_one :appendix_comorbidity, -> { order('pos_id asc') }, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_comorbidity
    validates_associated :appendix_comorbidity

    before_validation do
      self.appendix_comorbidity ||= build_appendix_comorbidity(pos_id: 0)
    end
  end
end
