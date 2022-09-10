require_relative 'exceptions'

class Parser
  def call(tokens)
    opstack = []
    output = []
    lparen = 0

    tokens.each do |token|
      if token.operand?
        output << token
      end

      if token.lparen?
        opstack << token
      end

      if token.rparen?
        loop do
          if opstack.empty?
            raise ParsingError, "Malformed expression: parenthesis mismatch" if opstack.empty?
          else
            top = opstack.pop

            if top.lparen?
              break
            else
              output << top
            end
          end
        end
      end

      if token.operator?
        while !(opstack.empty? or opstack.last.precedence < token.precedence) do
          output << opstack.pop
        end

        opstack << token
      end
    end

    while !opstack.empty? do
      output << opstack.pop
    end

    output
  end
end
