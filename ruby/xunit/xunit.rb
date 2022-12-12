# TODO: テストメソッドを呼び出す
# TODO set_upを最初に呼び出す
# TODO tear_downを後で呼び出す
# TODO テストメソッドが失敗したとしてもtear_downを呼び出す
# TODO 複数のテストを呼び出す
# TODO 収集したテスト結果を出力する

class WasRun
  attr_accessor :was_run

  def initialize(name)
    @was_run = 'None'
    @name = name
  end

  def test_method
    self.was_run = 1
    was_run
  end

  def run
    test_method
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.run
puts test.was_run
