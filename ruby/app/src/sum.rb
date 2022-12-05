# frozen_string_literal: true

require './expression'

class Sum
  include Expression

  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end
end
