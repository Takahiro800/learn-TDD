require './money'

class Dollar < Money
  attr_reader :currency

  def initialize(amount)
    super
    @currency = 'USD'
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end
end
