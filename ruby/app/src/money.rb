# frozen_string_literal: true

class Money
  attr_reader :amount, :currency

  def initialize(amount)
    @amount = amount
  end

  def equals?(other)
    # CHECK モデルにクラスが登場するのは不吉な匂いがする
    amount == other.amount && instance_of?(other.class)
  end

  # NOTE: Effective Ruby p.43
  def eql?(other)
    # amount.eql?(other.amount)
    amount.eql?(other.amount)
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  # def currency
  #   # NOTE: 抽象メソッドを自作
  #   currency_proc
  # end

  # def currency_proc
  #   raise 'call abstract!'
  # end
end
