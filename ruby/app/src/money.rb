# frozen_string_literal: true

require './expression'
require './sum'

class Money
  include Expression

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equals?(other)
    # CHECK モデルにクラスが登場するのは不吉な匂いがする
    # NOTE instance_of? / is_a? の違い
    # レシーバのみの評価　or スーパークラスも評価
    # NOTE ==とeql?の違い (Effective Ruby p.23)
    amount == other.amount && currency == other.currency
  end

  # NOTE: Effective Ruby p.43
  def eql?(other)
    amount.eql?(other.amount)
  end

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    raise ArgumentError unless bank.instance_of?(Bank)

    rate = bank.rate(currency, to)
    Money.new(amount / rate, to)
  end

  # def currency
  #   # NOTE: 抽象メソッドを自作
  #   currency_proc
  # end

  # def currency_proc
  #   raise 'call abstract!'
  # end
end
