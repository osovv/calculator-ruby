class Token
  attr_reader :id, :ignore, :precedence, :value, :group

  def initialize(token_type, value)
    @id = token_type.id
    @ignore = token_type.options[:ignore]
    @precedence = token_type.options[:precedence]
    @group = token_type.group
    @value = value
  end

  def operator?
    @group.eql?(:operator)
  end

  def operand?
    @group.eql?(:operand)
  end

  def lparen?
    @group.eql?(:lparen)
  end

  def rparen?
    @group.eql?(:rparen)
  end

  def func?
    @group.eql?(:func)
  end
end
