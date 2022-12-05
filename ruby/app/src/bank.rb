# frozen_string_literal: true

class Bank
  def reduce(source, to)
    return source.reduce(to) if source.instance_of?(Money)

    raise ArgumentError unless source.instance_of?(Sum)

    source.reduce(to)
  end
end
