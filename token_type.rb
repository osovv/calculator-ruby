class TokenType
  DEFAULT_OPTIONS = {
    ignore: false,
    precedence: 0
  }.freeze

  attr_reader :id, :pattern, :options

  def initialize(id, pattern, options = {})
    @id = id
    @pattern = pattern
    @options = DEFAULT_OPTIONS.merge(options)
  end
end
