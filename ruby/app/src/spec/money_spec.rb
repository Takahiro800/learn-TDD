require './dollar'

# TODO: $5 + 10CHF = $10(レートが2:1の場合)
# DONE $5 * 2 = $10
# TODO amountをprivateにする
# DONE Dollarの副作用どうする？
# TODO Moneyの丸め処理どうする?
# DONE equals()
# TODO hash_code()
# TODO nullとの等価性比較
# TODO 他のオブジェクトとの等価比較性

RSpec.describe Dollar do
  # FIX: 必要なデータを切り出して準備する
  it '#times' do
    five = Dollar.new(5)

    expect(five.times(2).eql?(Dollar.new(10))).to be_truthy
    expect(five.times(3).eql?(Dollar.new(15))).to be_truthy
  end

  describe '#equals' do
    it '#equals' do
      expect(Dollar.new(5).equals?(Dollar.new(5))).to be_truthy
      expect(Dollar.new(5).equals?(Dollar.new(6))).to be_falsey
    end
  end
end
