require './money'
require './dollar'
require './franc'
require './bank'

# TODO: $5 + 10CHF = $10(レートが2:1の場合)
# TODO: $5 + $5 = $10
# TODO: $5 + $5 がMoneyを返す
# DONE $5 * 2 = $10
# DONE amountをprivateにする
# DONE Dollarの副作用どうする？
# TODO Moneyの丸め処理どうする?
# DONE equals()
# TODO hash_code()
# TODO nullとの等価性比較
# TODO 他のオブジェクトとの等価比較性
# DONE 5CHF * 2 = 10CHF
# TODO DollarとFrancの重複
# DONE equalsの一般化
# DONE　timesの一般化
# DONE　FrancとDollarを比較する
# TODO 通貨の概念
# TODO Franc#timesのテストを削除する?

# rubocop:disable Metrics/BlockLength
RSpec.describe Money do
  # FIX: 必要なデータを切り出して準備する
  describe '#times' do
    it 'dollar' do
      # NOTE: Factory MEthodを定義(p.48)
      five = Money.dollar(5)

      expect(five.times(2).equals?(Money.dollar(10))).to be_truthy
      expect(five.times(3).equals?(Money.dollar(15))).to be_truthy
    end
    it '#times' do
      five = Money.franc(5)

      expect(five.times(2).equals?(Money.franc(10))).to be_truthy
      expect(five.times(3).equals?(Money.franc(15))).to be_truthy
    end
  end

  it '#equals' do
    expect(Money.dollar(5).equals?(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equals?(Money.dollar(6))).to be_falsey

    expect(Money.franc(5).equals?(Money.dollar(5))).to be_falsey
  end

  describe '#currency' do
    it 'Dollar' do
      expect(Money.dollar(1).currency).to eq 'USD'
    end
    it 'Franc' do
      expect(Money.franc(1).currency).to eq 'CHF'
    end
  end

  describe 'Addition' do
    it 'Simple Addition' do
      five = Money.dollar(5)
      sum = five.plus(five)

      bank = Bank.new
      reduced = bank.reduce(sum, 'USD')
      expect(Money.dollar(10).equals?(reduced)).to be_truthy
    end

    it 'Return Sum' do
      five = Money.dollar(5)
      result = five.plus(five)

      expect(result.augend.equals?(five)).to be_truthy
      expect(result.addend.equals?(five)).to be_truthy
    end

    it 'Reduce Sum' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, 'USD')

      expect(result.equals?(Money.dollar(7))).to be_truthy
    end
  end
end
