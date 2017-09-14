require_relative "../ext_range.rb"
require "test/unit"

class TestExtRange < Test::Unit::TestCase

  def setup
    @range = ExtRange.new(-10, 10)
  end

  def test_empty_method
    assert_respond_to(@range, :empty?)
    assert(ExtRange.new(5, -5).empty?)
    assert(!ExtRange.new(-5, 5).empty?)
  end

  def test_series_sum_method
    assert_respond_to(@range, :series_sum)
    assert_equal(6, ExtRange.new(1, 3).series_sum)
    assert_equal(0, ExtRange.new(-100, 100).series_sum)
  end

  def test_out_of_range
    assert(@range.cover?(-10..10))
    assert(@range.cover?(-3..3))
    assert(!@range.cover?(-11..10))
    assert(!@range.cover?(-11..11))
    assert(!@range.cover?(11..-11))
    assert(@range.cover?(1))
    assert(ExtRange.new('a', 'z').cover?('g'))
    assert(@range.cover?(ExtRange.new(-5,5)))
  end
end
