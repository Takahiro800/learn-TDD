require './money'

class Dollar < Money
  attr_reader :amount

  def initialize(amount)
    # CHECK superを使う場合は Effective Ruby(p.25~)参照する
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
