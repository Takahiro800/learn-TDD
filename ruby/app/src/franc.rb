class Franc < Money
  def initialize(amount)
    super
    @currency = 'CHF'
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end
end
