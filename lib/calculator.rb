require_relative 'lexer'
require_relative 'parser'
require_relative 'evaluator'
require_relative 'token_type'
require_relative 'grammar'

class Calculator
  def initialize
    @grammar = Grammar.new
    @lexer = Lexer.new(@grammar)
    @parser = Parser.new
    @evaluator = Evaluator.new
  end

  def run(expression)
    @evaluator.(@parser.(@lexer.(expression)))
  end
end
