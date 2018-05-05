require 'test/unit/assertions'
include Test::Unit::Assertions

class TeatCase
  def initialize(name)
    @name = name
  end
  def set_up
  end
  def tear_down
  end
  def run
    set_up
    send(@name)
    tear_down
  end
end
class WasRun < TeatCase
  attr_reader :log
  def set_up
    @log = 'set_up '
  end
  def test_method
    @log += 'test_method '
  end
  def tear_down
    @log += 'tear_down '
  end
end
class TestCaseTest < TeatCase
  def test_template_method
    test = WasRun.new 'test_method'
    test.run
    assert_equal('set_up test_method tear_down ', test.log)
  end
end

TestCaseTest.new('test_template_method').run

