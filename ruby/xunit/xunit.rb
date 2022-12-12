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

  def set_up; end

  def run
    # NOTE: Pluggable Selector パターン
    # [Pluggable Selector - Ruby Patterns](https://rubypatterns.dev/general/pluggable_selector.html)
    # method = send(name)
    set_up
    send(@name)
  end
end

class WasRun < TestCase
  attr_accessor :was_set_up

  def test_method
    self.was_run = nil
    self.was_run = 1
  end

  def set_up
    self.was_set_up = 1
  end
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    test.run
    raise 'Assertion Error' unless test.was_run
  end

  def test_set_up
    test = WasRun.new('test_method')
    test.run

    raise 'Assertion Error' unless test.was_set_up
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.run
puts test.was_run

TestCaseTest.new('test_running').run
TestCaseTest.new('test_set_up').run
