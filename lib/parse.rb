require_relative 'exceptions'

class Parse
  def call(tokens)
    opstack = []
    output = []
    lparen = 0

    tokens.each do |token|
      case token.group
        in :operand
          output << token
        in :operator
          while !(opstack.empty? or opstack.last.precedence < token.precedence) do
            output << opstack.pop
          end

          opstack << token
        in :func
          while !(opstack.empty? or opstack.last.precedence < token.precedence) do
            output << opstack.pop
          end

          opstack << token
        in :lparen
          opstack << token
        in :rparen
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
    end

    while !opstack.empty? do
      output << opstack.pop
    end

    output
  end
end
