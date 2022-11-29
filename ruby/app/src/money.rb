# frozen_string_literal: true

class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def equals?(money)
    amount == money.amount
  end
end
