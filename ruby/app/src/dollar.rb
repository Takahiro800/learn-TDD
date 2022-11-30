require './money'

class Dollar < Money
  def initialize(amount)
    super
    @currency = 'USD'
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end
end
