require './money'
require './dollar'
require './franc'

# TODO: $5 + 10CHF = $10(レートが2:1の場合)
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
# TODO　timesの一般化
# DONE　FrancとDollarを比較する
# TODO 通貨の概念
# TODO Franc#timesのテストを削除する?

# rubocop:disable Metrics/BlockLength
RSpec.describe Money do
  # FIX: 必要なデータを切り出して準備する
  it '#times' do
    # NOTE: Factory MEthodを定義(p.48)
    five = Money.dollar(5)

    expect(five.times(2).eql?(Money.dollar(10))).to be_truthy
    expect(five.times(3).eql?(Money.dollar(15))).to be_truthy
  end

  describe '#equals' do
    it Dollar do
      expect(Money.dollar(5).equals?(Money.dollar(5))).to be_truthy
      expect(Money.dollar(5).equals?(Money.dollar(6))).to be_falsey
    end

    it Franc do
      expect(Money.franc(5).equals?(Money.franc(5))).to be_truthy
      expect(Money.franc(5).equals?(Money.franc(6))).to be_falsey
    end

    it 'FrancとDollarの比較' do
      expect(Money.franc(5).equals?(Money.dollar(5))).to be_falsey
    end
  end

  describe '#currency' do
    it 'Dollar' do
      expect(Money.dollar(1).currency).to eq 'USD'
    end
    it 'Franc' do
      expect(Money.franc(1).currency).to eq 'CHF'
    end
  end
end

RSpec.describe Franc do
  it '#times' do
    five = Money.franc(5)

    expect(five.times(2).eql?(Money.franc(10))).to be_truthy
    expect(five.times(3).eql?(Money.franc(15))).to be_truthy
  end
end
# rubocop:enable Metrics/BlockLength
