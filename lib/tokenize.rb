require_relative 'token'
require_relative 'exceptions'
require 'strscan'

class Tokenize
  def initialize(grammar)
    @token_types = grammar.token_types
  end

  def call(input)
    scanner = StringScanner.new(input)
    tokens = []

    while !scanner.eos? do
      current_pos = scanner.pos

      @token_types.each do |token_type|
        match = scanner.scan(token_type.pattern)

        if !(match.nil? or token_type.options[:ignore])
          tokens << Token.new(token_type, match)
        end
      end

      if current_pos == scanner.pos
        raise TokenizationError, "Invalid token found near '#{scanner.rest()}'"
        scanner.terminate
      end
    end

    tokens
  end
end
