require_relative 'lexer'
require_relative 'parse'
require_relative 'evaluate'
require_relative 'token_type'
require_relative 'grammar'

class Calculate
  def initialize
    @grammar = Grammar.new
    @lexer = Lexer.new(@grammar)
    @parse = Parse.new
    @evaluate = Evaluate.new
  end

  def call(expression)
    @evaluate.(@parse.(@lexer.(expression)))
  end
end
