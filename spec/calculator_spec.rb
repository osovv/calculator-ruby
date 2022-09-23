require 'test-unit'
require_relative '../lib/calculator'

class TestLexer < Test::Unit::TestCase
  def test_addition
    calculator = Calculator.new
    assert_equal(0, calculator.run('(-1) + 1'))
    assert_equal(0, calculator.run('0 + 0'))
    assert_equal(2, calculator.run('1 + 1'))
    assert_equal(3.4, calculator.run('2.3 + 1.1'))
    assert_equal(-10, calculator.run('(-11) + 1'))
  end

  def test_substraction
    calculator = Calculator.new
    assert_equal(0, calculator.run('0 - 0'))
    assert_equal(1, calculator.run('3 - 2'))
    assert_equal(10.5, calculator.run('10.7 - 0.2'))
    assert_equal(-15, calculator.run('(-8) - 7'))
  end

  def test_multiplication
    calculator = Calculator.new
    assert_equal(0, calculator.run('0 * 0'))
    assert_equal(0, calculator.run('0 * 123'))
    assert_equal(25, calculator.run('5 * 5'))
    assert_equal(12.4, calculator.run('4 * 3.1'))
    assert_equal(-18, calculator.run('(-3) * 6'))
  end

  def test_division
    calculator = Calculator.new
    assert_equal(0, calculator.run('0 / 1'))
    assert_equal(20, calculator.run('100 / 5'))
    assert_equal(4.8, calculator.run('24 / 5'))
    assert_equal(-17, calculator.run('(-85) / 5'))
  end

  def test_divide_by_zero
    calculator = Calculator.new
    assert_raise(ArgumentError) do
      calculator.run('1 / 0')
    end
  end

  def test_pharentesis
    calculator = Calculator.new
    assert_equal(10, calculator.run('(1 + 4) * 2'))
    assert_equal(7, calculator.run('((((((5 + 2))))))'))
    assert_equal(-5, calculator.run('(-5) + 0'))
  end


  def test_log
    calculator = Calculator.new
    assert_equal(2, calculator.run('log 100 10'))
    assert_equal(Float::INFINITY, calculator.run('log 4 1'))
    assert_equal(0.5, calculator.run('log 10 100'))
  end

  def test_pharentesis_mismatch
    calculator = Calculator.new
    assert_raise(ParsingError) do
      calculator.run('1 + (2 + 3))')
      calculator.run(') 5 + 4(')
      calculator.run('(4 + 3)) * 2')
    end
  end

  def test_invalid_token
    calculator = Calculator.new
    assert_raise(TokenizationError) do
      calculator.run('a + 1')
      calculator.run('55 ? 1')
      calculator.run('hello')
    end
  end
end
