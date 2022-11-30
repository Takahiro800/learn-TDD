class Franc < Money
  def initialize(amount, currency)
    super(amount)
    @currency = currency
  end

  def times(multiplier)
    Money.franc(amount * multiplier)
  end
end
