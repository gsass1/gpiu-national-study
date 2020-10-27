module CultureResult
  extend ActiveSupport::Concern

  included do
    has_one :appendix_culture_result, -> {order('pos_id asc')}, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_culture_result

    before_validation do
      self.appendix_culture_result ||= self.build_appendix_culture_result( pos_id: 0 )
    end
  end
end
