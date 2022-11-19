require 'test-unit'
require_relative '../lib/calculate'

class TestCalculate < Test::Unit::TestCase
  def test_addition
    calculate = Calculate.new
    assert_equal(0.0, calculate.('(-1) + 1'))
    assert_equal(0.0, calculate.('0 + 0'))
    assert_equal(2.0, calculate.('1 + 1'))
    assert_equal(3.4, calculate.('2.3 + 1.1'))
    assert_equal(-10, calculate.('(-11) + 1'))
  end

  def test_substraction
    calculate = Calculate.new
    assert_equal(0.0, calculate.('0 - 0'))
    assert_equal(1.0, calculate.('3 - 2'))
    assert_equal(10.5, calculate.('10.7 - 0.2'))
    assert_equal(-15.0, calculate.('(-8) - 7'))
  end

  def test_multiplication
    calculate = Calculate.new
    assert_equal(0.0, calculate.('0 * 0'))
    assert_equal(0.0, calculate.('0 * 123'))
    assert_equal(25.0, calculate.('5 * 5'))
    assert_equal(12.4, calculate.('4 * 3.1'))
    assert_equal(-18.0, calculate.('(-3) * 6'))
  end

  def test_division
    calculate = Calculate.new
    assert_equal(0.0, calculate.('0 / 1'))
    assert_equal(20.0, calculate.('100 / 5'))
    assert_equal(4.8, calculate.('24 / 5'))
    assert_equal(-17.0, calculate.('(-85) / 5'))
  end

  def test_divide_by_zero
    calculate = Calculate.new
    assert_raise(ArgumentError) do
      calculate.('1 / 0')
    end
  end

  def test_pharentesis
    calculate = Calculate.new
    assert_equal(10.0, calculate.('(1 + 4) * 2'))
    assert_equal(7.0, calculate.('((((((5 + 2))))))'))
    assert_equal(-5.0, calculate.('(-5) + 0'))
  end

  def test_log
    calculate = Calculate.new
    assert_equal(2.0, calculate.('log 100 10'))
    assert_equal(Float::INFINITY, calculate.('log 4 1'))
    assert_equal(0.5, calculate.('log 10 100'))
  end

   def test_exp
    calculate = Calculate.new
    assert_equal(1.0, calculate.('100 ^ 0'))
    assert_equal(100.0, calculate.('100 ^ 1'))
    assert_equal(5.0, calculate.('25 ^ 0.5'))
    assert_equal(25.0, calculate.('5 ^ 2'))
  end

  def test_pharentesis_mismatch
    calculate = Calculate.new
    assert_raise(ParsingError) do
      calculate.('1 + (2 + 3))')
      calculate.(') 5 + 4(')
      calculate.('(4 + 3)) * 2')
    end
  end

  def test_invalid_token
    calculate = Calculate.new
    assert_raise(TokenizationError) do
      calculate.('a + 1')
      calculate.('55 ? 1')
      calculate.('hello')
    end
  end
end
