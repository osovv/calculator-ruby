require_relative 'lexer'
require_relative 'parser'
require_relative 'evaluator'
require_relative 'token_type'

class Calculator
  TOKEN_TYPES = [
    TokenType.new(:decimal,     /(\-)?(\d*\.)?\d+/,  precedence: 0),
    TokenType.new(:integer,     /(\-)?\d+/,          precedence: 0),
    TokenType.new(:add,         /\+/,           precedence: 10),
    TokenType.new(:sub,         /-/,            precedence: 10),
    TokenType.new(:mult,        /\*/,           precedence: 20),
    TokenType.new(:div,         /\//,           precedence: 20),
    TokenType.new(:whitespace,  /\s+/,          ignore: true),
    TokenType.new(:lparen,      /\(/,           precedence: 1),
    TokenType.new(:rparen,      /\)/,           precedence: 1)
  ].freeze

  def initialize(token_types = TOKEN_TYPES)
    @lexer = Lexer.new(token_types)
    @parser = Parser.new
    @evaluator = Evaluator.new
  end

  def run(expression)
    @evaluator.(@parser.(@lexer.(expression)))
  end
end
