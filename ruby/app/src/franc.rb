class Franc < Money
  attr_reader :amount

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end
end
