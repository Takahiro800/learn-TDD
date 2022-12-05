# frozen_string_literal: true

class Bank
  def reduce(source, to)
    raise ArgumentError unless source.instance_of?(Sum)

    amount = source.augend.amount + source.addend.amount
    Money.new(amount, to)
  end
end
