# frozen_string_literal: true

class AppendixCultureResult < ApplicationRecord
  include Discard::Model
  include Exportable
  include SusceptibilityTests

  belongs_to :questionnaire, polymorphic: true, optional: true
  validates :pos_id, presence: { strict: true }

  enum susceptibility_standard: {
    nccls_clsi: 1,
    din: 2,
    eucast: 3,
    unknown: 5,
    other: 4
  }, _prefix: true

  with_options unless: :new_record? do
    validates :susceptibility_standard, presence: true
    validates :susceptibility_standard_other_specify,
              presence: true, if: :susceptibility_standard_other?
  end

  def first_susceptibility_test
    @first_susceptibility_test ||= get_susceptibility_test(0)
  end

  def second_susceptibility_test
    @second_susceptibility_test ||= get_susceptibility_test(1)
  end

  def susceptibility_test_count
    2
  end

  exports_as do |e, p|
    e.export p.first_susceptibility_test, prefix: 'i'
    e.export p.second_susceptibility_test, prefix: 'ii'

    e.value 'iii', p.susceptibility_standard
    e.value 'iii_s', p.susceptibility_standard_other_specify if p.susceptibility_standard_other?
  end
end
