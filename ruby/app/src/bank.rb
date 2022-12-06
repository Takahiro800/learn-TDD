# frozen_string_literal: true

require './pair'

class Bank
  def initialize
    @rates = {}
  end

  def reduce(source, to)
    raise ArgumentError unless source.instance_of?(Money) || source.instance_of?(Sum)

    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[Pair.new(from, to)] = rate
  end

  def rate(from, to)
    return 1 if from.eql?(to)

    rate_key = find_rate_key(from, to)

    @rates[rate_key]
  end

  private

  def find_rate_key(from, to)
    rate_key = @rates.keys.find do |pair|
      pair.from == from && pair.to == to
    end

    raise ArgumentError if rate_key.nil?

    rate_key
  end
end
