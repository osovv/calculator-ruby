require_relative 'lib/calculator'

if ARGV.length != 1
  puts "Usage: #{$0} [expression]"
else
  calculator = Calculator.new
  puts "Result: #{calculator.run(ARGV[0])}"
end


