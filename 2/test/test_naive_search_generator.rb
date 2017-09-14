require_relative '../naive_search_generator'
require 'test/unit'
require 'prime'

class TestNaiveSearchGenerator < Test::Unit::TestCase

  def setup
    @generator = NaiveSearchGenerator.new
  end

  def test_succ_method
    Prime.each(100, Prime::EratosthenesGenerator.new) do |prime|
      assert_equal(prime, @generator.succ)
    end
  end

  def test_rewind_method
    @generator.succ
    @generator.succ
    assert_nil(@generator.rewind)
    assert_equal(2, @generator.succ)    
    assert_equal(3, @generator.succ)    
    assert_equal(5, @generator.succ)    
  end
end
