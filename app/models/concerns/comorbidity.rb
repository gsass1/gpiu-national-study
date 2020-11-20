module Comorbidity
  extend ActiveSupport::Concern

  included do
    has_one :appendix_comorbidity, -> {order('pos_id asc')}, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_comorbidity

    before_validation do
      self.appendix_comorbidity ||= self.build_appendix_comorbidity( pos_id: 0 )
    end
  end
end
