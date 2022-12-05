# frozen_string_literal: true

class Bank
  def reduce(source, to)
    raise ArgumentError unless source.instance_of?(Sum)

    source.reduce(to)
  end
end
