# frozen_string_literal: true

class Franc < Money
  # def initialize(amount, currency)
  #   super(amount, currency)
  #   # @currency = currency
  # end

  def times(multiplier)
    Franc.new(amount * multiplier, currency)
  end
end
