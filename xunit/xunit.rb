require 'test/unit/assertions'
include Test::Unit::Assertions

class TeatCase
  def initialize(name)
    @name = name
  end
  def set_up
  end
  def run
    send(@name)
  end
end
class WasRun < TeatCase
  attr_reader :was_run, :was_set_up
  def set_up
    @was_run = false
    @was_set_up = true
  end
  def test_method
    @was_run = true 
  end
end
class TestCaseTest < TeatCase
  #attr_reader :test
  def set_up
    @test = WasRun.new 'test_method'
  end
  def test_running
    @test.run
    assert_equal(true, @test.was_run)
  end
  def test_set_up
    @test.run
    assert_equal(true, @test.was_set_up)
  end
end

TestCaseTest.new('test_running').set_up.run
TestCaseTest.new('test_set_up').set_up.run

