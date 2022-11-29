# frozen_string_literal: true

class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def equals?(money)
    amount == money.amount
  end

  # NOTE: Effective Ruby p.43
  def eql?(other)
    amount.eql?(other.amount)
  end
end
