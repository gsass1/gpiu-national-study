# frozen_string_literal: true

module SusceptibilityTests
  extend ActiveSupport::Concern

  included do
    has_many :susceptibility_tests, -> { order('pos_id asc') }, dependent: :destroy
    accepts_nested_attributes_for :susceptibility_tests

    after_initialize :build_susceptibility_tests

    def get_susceptibility_test(pos_id)
      susceptibility_tests.each do |susceptibility_test|
        return susceptibility_test if susceptibility_test.pos_id == pos_id
      end
      nil
    end
  end

  private

  def build_susceptibility_tests
    numbers = []
    susceptibility_tests.each do |susceptibility_test|
      numbers << susceptibility_test.pos_id
    end

    ((0..susceptibility_test_count).to_a - numbers).each do |i|
      susceptibility_tests.build(pos_id: i)
    end
  end
end
