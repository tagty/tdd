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
    result = TestResult.new
    result.test_started
    set_up
    send(@name)
    tear_down
    result
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
  def test_broken_method
    raise
  end
end
class TestCaseTest < TeatCase
  def test_template_method
    test = WasRun.new 'test_method'
    test.run
    assert_equal('set_up test_method tear_down ', test.log)
  end
  def test_result
    test = WasRun.new 'test_method'
    result = test.run
    assert_equal('1 run, 0 failed', result.summary)
  end
  def test_failed_result
    test = WasRun.new 'test_broken_method'
    result = test.run
    assert_equal('1 run, 1 failed', result.summary)
  end
end
class TestResult
  def initialize
    @run_count = 0
  end
  def test_started
    @run_count += 1
  end
  def summary
    "%d run, 0 failed" % @run_count
  end
end
TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
#TestCaseTest.new('test_failed_result').run

