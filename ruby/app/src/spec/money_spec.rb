require './dollar'

# TODO: $5 + 10CHF = $10(レートが2:1の場合)
# DONE $5 * 2 = $10
# TODO amountをprivateにする
# DONE Dollarの副作用どうする？
# TODO Moneyの丸め処理どうする?
# TODO equals()
# TODO hash_code()

RSpec.describe Dollar do
  # FIX: 必要なデータを切り出して準備する
  it '$5 * 2 = $10' do
    five = Dollar.new(5)
    # five.times(2)
    # expect(five.amount).to eq 10

    # five.times(3)
    # expect(five.amount).to eq 15

    product = five.times(2)
    expect(product.amount).to eq 10

    product = five.times(3)
    expect(product.amount).to eq 15
  end

  describe '#equals' do
    it '#equals' do
      expect(Dollar.new(5).equals?(Dollar.new(5)))
    end
  end
end
