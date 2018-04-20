require 'test/unit/assertions'
include Test::Unit::Assertions

class TeatCase
  def initialize(name)
    @name = name
  end
  def run
    send(@name)
  end
end
class WasRun < TeatCase
  attr_reader :was_run
  def initialize(name)
    @was_run = false
    super(name)
  end
  def test_method
    @was_run = true 
  end
end
class TestCaseTest < TeatCase
  def test_running
    test = WasRun.new 'test_method'
    assert_equal(false, test.was_run)
    test.run
    assert_equal(true, test.was_run)
  end
end

TestCaseTest.new('test_running').run

