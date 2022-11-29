class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end

  def equals?(dollar)
    amount == dollar.amount
  end

  # NOTE: Effective Ruby p.43
  def eql?(other)
    amount.eql?(other.amount)
  end
end
