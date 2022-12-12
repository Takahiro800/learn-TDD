# frozen_string_literal: true

# DONE: テストメソッドを呼び出す
# TODO set_upを最初に呼び出す
# TODO tear_downを後で呼び出す
# TODO テストメソッドが失敗したとしてもtear_downを呼び出す
# TODO 複数のテストを呼び出す
# TODO 収集したテスト結果を出力する

class TestCase
  attr_accessor :was_run, :name

  def initialize(name)
    @was_run = nil
    @name = name
  end

  def run
    # NOTE: Pluggable Selector パターン
    # [Pluggable Selector - Ruby Patterns](https://rubypatterns.dev/general/pluggable_selector.html)
    # method = send(name)
    send(@name)
  end
end

class WasRun < TestCase
  def test_method
    self.was_run = 1
    was_run
  end
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    raise 'Assertion Error' if test.was_run

    test.run
    raise 'Assertion Error' unless test.was_run
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.run
puts test.was_run

TestCaseTest.new('test_running').run
