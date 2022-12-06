# frozen_string_literal: true

class Pair
  attr_reader :from, :to

  def initialize(from, to)
    raise ArgumentError unless from.instance_of?(String)
    raise ArgumentError unless to.instance_of?(String)

    @from = from
    @to = to
  end

  def equals?(object)
    raise ArgumentError unless object.instance_of?(Pair)

    from.eql?(object.from) && to.eql?(object.to)
  end

  def hash_code
    0
  end
end
