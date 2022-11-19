require_relative 'tokenize'
require_relative 'parse'
require_relative 'evaluate'
require_relative 'token_type'
require_relative 'grammar'

class Calculate
  def initialize
    @grammar = Grammar.new
    @tokenize = Tokenize.new(@grammar)
    @parse = Parse.new
    @evaluate = Evaluate.new
  end

  def call(expression)
    @evaluate.(@parse.(@tokenize.(expression)))
  end
end
