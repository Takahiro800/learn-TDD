require './money'

class Dollar < Money
  def times(multiplier)
    Dollar.new(amount * multiplier)
  end

  # NOTE: Effective Ruby p.43
  def eql?(other)
    amount.eql?(other.amount)
  end
end
