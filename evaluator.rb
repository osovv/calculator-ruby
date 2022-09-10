class Evaluator
  def call (postfix_expression)
    stack = []

    postfix_expression.each do |token|
      if token.operand?
        stack.push(token.value)
      else
        op2 = stack.pop
        op1 = stack.pop

        has_nil = op2.nil? || op1.nil?

        is_integer = integer?(op1) && integer?(op2)

        cast_to = if is_integer
          :to_i
        else
          :to_f
        end

        if has_nil
          raise "Malformed expression: too many operators"
        end

        case token.id
        when :add
          stack.push(op1.send(cast_to) + op2.send(cast_to))
        when :sub
          stack.push(op1.send(cast_to) - op2.send(cast_to))
        when :mult
          stack.push(op1.send(cast_to) * op2.send(cast_to))
        when :div
          if op2.send(cast_to) == 0
            raise ArgumentError, "Can't divide by zero!" if op2.send(cast_to) == 0
          else
            stack.push(op1.send(cast_to) / op2.send(cast_to))
          end
        end
      end
    end

    if stack.empty?
      nil
    else
      stack.pop
    end
  end

  private

  def integer?(value)
    Integer(value, exception: false)
  end
end
