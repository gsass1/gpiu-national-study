# frozen_string_literal: true

module CultureResults
  extend ActiveSupport::Concern

  included do
    has_many :appendix_culture_results, -> { order('pos_id asc') }, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_culture_results

    before_validation :build_culture_results

    def get_culture_result(pos_id)
      appendix_culture_results.each do |appendix_culture_result|
        return appendix_culture_result if appendix_culture_result.pos_id == pos_id
      end
      nil
    end
  end

  private

  def build_culture_results
    numbers = []
    appendix_culture_results.each do |appendix_culture_result|
      numbers << appendix_culture_result.pos_id
    end

    ((0..appendix_culture_result_count).to_a - numbers).each do |i|
      appendix_culture_results.build(pos_id: i)
    end
  end
end
