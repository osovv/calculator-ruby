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

        coerce_to = :to_f

        coerced_op1 = op1.send(coerce_to)
        coerced_op2 = op2.send(coerce_to)

        if has_nil
          raise "Malformed expression: too many operators"
        end

        case token.id
        when :exp
          stack.push(coerced_op1 ** coerced_op2)
        when :log
          stack.push(Math.log(coerced_op1, coerced_op2))
        when :add
          stack.push(coerced_op1 + coerced_op2)
        when :sub
          stack.push(coerced_op1 - coerced_op2)
        when :mult
          stack.push(coerced_op1 * coerced_op2)
        when :div
          if coerced_op2.eql?(0.0)
            raise ArgumentError, "Can't divide by zero!" if coerced_op2 == 0
          else
            if !((coerced_op1 % coerced_op2).eql?(0))
              stack.push(coerced_op1.to_f / coerced_op2)
            else
              stack.push(coerced_op1 / coerced_op2)
            end
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
end
