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
  def run(result)
    result.test_started
    set_up
    begin
      send(@name)
    rescue
      result.test_failed
    end
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
  def test_broken_method
    raise
  end
end
class TestCaseTest < TeatCase
  def set_up
    @result = TestResult.new
  end
  def test_template_method
    test = WasRun.new 'test_method'
    test.run @result
    assert_equal('set_up test_method tear_down ', test.log)
  end
  def test_result
    test = WasRun.new 'test_method'
    test.run @result
    assert_equal('1 run, 0 failed', @result.summary)
  end
  def test_failed_result
    test = WasRun.new 'test_broken_method'
    test.run @result
    assert_equal('1 run, 1 failed', @result.summary)
  end
  def test_failed_result_formatting
    @result.test_started
    @result.test_failed
    assert_equal('1 run, 1 failed', @result.summary)
  end
  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new('test_method'))
    suite.add(WasRun.new('test_broken_method'))
    suite.run @result
    assert_equal('2 run, 1 failed', @result.summary)
  end
end
class TestResult
  def initialize
    @run_count = 0
    @error_count = 0
  end
  def test_started
    @run_count += 1
  end
  def test_failed
    @error_count += 1
  end
  def summary
    "%d run, %d failed" % [@run_count, @error_count]
  end
end
class TestSuite
  def initialize
    @tests = []
  end
  def add(test)
    @tests << test
  end
  def run(result)
    @tests.each do |test|
      test.run(result)
    end
  end
end

suite = TestSuite.new
suite.add TestCaseTest.new('test_template_method')
suite.add TestCaseTest.new('test_result')
suite.add TestCaseTest.new('test_failed_result')
suite.add TestCaseTest.new('test_failed_result_formatting')
suite.add TestCaseTest.new('test_suite')
result = TestResult.new
suite.run result
puts result.summary

