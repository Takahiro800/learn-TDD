# frozen_string_literal: true

require './expression'

class Sum
  include Expression

  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    raise ArgumentError unless to.instance_of?(String)

    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end
