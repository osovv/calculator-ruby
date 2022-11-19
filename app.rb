require_relative 'lib/calculate'

if ARGV.length != 1
  puts "Usage: #{$0} [expression]"
else
  calculate = Calculate.new
  puts "Result: #{calculate.(ARGV[0])}"
end


