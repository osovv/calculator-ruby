class TokenType
  DEFAULT_OPTIONS = {
    ignore: false,
    precedence: 0
  }.freeze

  attr_reader :id, :group, :pattern, :options

  def initialize(id, group, pattern, options = {})
    @id = id
    @pattern = pattern
    @group = group
    @options = DEFAULT_OPTIONS.merge(options)
  end
end
