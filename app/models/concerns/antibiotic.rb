module Antibiotic
  extend ActiveSupport::Concern

  included do
    has_one :appendix_antibiotic, -> {order('pos_id asc')}, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_antibiotic

    before_validation do
      self.appendix_antibiotic ||= self.build_appendix_antibiotic( pos_id: 0 )
    end
  end
end
