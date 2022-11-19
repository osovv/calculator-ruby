require_relative 'lexer'
require_relative 'parser'
require_relative 'evaluate'
require_relative 'token_type'
require_relative 'grammar'

class Calculate
  def initialize
    @grammar = Grammar.new
    @lexer = Lexer.new(@grammar)
    @parser = Parser.new
    @evaluate = Evaluate.new
  end

  def call(expression)
    @evaluate.(@parser.(@lexer.(expression)))
  end
end
