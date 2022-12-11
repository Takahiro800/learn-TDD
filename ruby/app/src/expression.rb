# frozen_string_literal: true

module Expression
  def reduce(bank, to); end

  def times(_multiplier)
    raise 'call abstract!'
  end
end
