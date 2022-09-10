require_relative 'lib/calculator'

if ARGV.length != 1
  puts "Usage: #{$0} [expression]"
else
  begin
    calculator = Calculator.new
    puts "Result: #{calculator.run(ARGV[0])}"
  rescue => e
    puts e.message
  end
end


