# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppendixUrinaryTractObstruction, type: :model do
  subject { urinary_tract_obstruction }

  let(:urinary_tract_obstruction) do
    described_class.new(
      lower: false,
      middle: false,
      upper: false,
      ureteropelvic_junction: false
    )
  end

  it { is_expected.to be_valid }
end
