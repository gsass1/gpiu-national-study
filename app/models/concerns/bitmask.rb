module Bitmask
  extend ActiveSupport::Concern

  class_methods do
    # NOTE: do NOT change order
    def bitmask(name, states)
      states.each_with_index do |state, index|
        n = 2**index

        define_method "#{state}?" do
          (self[name] & n) == n
        end

        define_method state do
          (self[name] & n) == n
        end

        define_method "#{state}=" do |flag|
          if flag == true || flag == 1 || flag == "1"
            self[name] |= n
          else
            self[name] &= ((2**32-1) ^ n)
          end
        end
      end
    end
  end
end
