class Franc < Money
  attr_reader :currency

  def initialize(amount)
    super
    @currency = 'CHF'
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end
end
