class Token
  attr_reader :id, :ignore, :precedence, :value

  def initialize(token_type, value)
    @id = token_type.id
    @ignore = token_type.options[:ignore]
    @precedence = token_type.options[:precedence]
    @value = value
  end

  def operator?
    [:add, :sub, :mult, :div].include? @id
  end

  def operand?
    [:decimal, :integer].include? @id
  end

  def lparen?
    @id == :lparen
  end

  def rparen?
    @id == :rparen
  end

  def to_s
    "#{value}"
  end
end
