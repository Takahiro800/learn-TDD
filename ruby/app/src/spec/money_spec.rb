require './dollar'

# TODO: $5 + 10CHF = $10(レートが2:1の場合)
# DONE $5 * 2 = $10
# TODO amountをprivateにする
# TODO Dollarの副作用どうする？
# TODO Moneyの丸め処理どうする?

RSpec.describe '仮実装' do
  it '$5 * 2 = $10' do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq 10
  end
end
