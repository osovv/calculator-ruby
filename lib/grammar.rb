require_relative 'token_type'

class Grammar
  attr_accessor :token_types

  TOKEN_TYPES = [
    TokenType.new(:decimal,     :operand,   /(\-)?(\d*\.)?\d+/, precedence: 0),
    TokenType.new(:integer,     :operand,   /(\-)?\d+/,         precedence: 0),
    TokenType.new(:add,         :operator,  /\+/,               precedence: 10),
    TokenType.new(:sub,         :operator,  /-/,                precedence: 10),
    TokenType.new(:mult,        :operator,  /\*/,               precedence: 20),
    TokenType.new(:div,         :operator,  /\//,               precedence: 20),
    TokenType.new(:whitespace,  :none,      /\s+/,              ignore: true),
    TokenType.new(:lparen,      :lparen,    /\(/,               precedence: 1),
    TokenType.new(:rparen,      :rparen,    /\)/,               precedence: 1),
    TokenType.new(:log,         :func,      /log/,              precedence: 30),
    TokenType.new(:exp,         :operator,  /\^/,               precedence: 21)
  ].freeze

  def initialize(token_types = TOKEN_TYPES)
    @token_types = token_types
  end
end
