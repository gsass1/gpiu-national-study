module Antibiotics
  extend ActiveSupport::Concern

  included do
    has_many :appendix_antibiotics, -> {order('pos_id asc')}, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_antibiotics

    before_validation do
      numbers = []
      self.appendix_antibiotics.each do |appendix_antibiotic|
        numbers << appendix_antibiotic.pos_id
      end

      ((0..self.appendix_antibiotics_count).to_a - numbers).each do |i|
        self.appendix_antibiotics.build( pos_id: i )
      end
    end

    def get_appendix_antibiotics_at pos_id
      self.appendix_antibiotics.each do |appendix_antibiotic|
        return appendix_antibiotic if appendix_antibiotic.pos_id == pos_id
      end
      nil
    end
  end
end
