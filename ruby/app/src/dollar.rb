# frozen_string_literal: true

class Dollar < Money
  # def initialize(amount, currency)
  #   super(amount)
  #   @currency = currency
  # end

  def times(multiplier)
    Dollar.new(amount * multiplier, currency)
  end
end
