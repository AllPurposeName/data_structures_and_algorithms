require "benchmark"
require "ostruct"
# Benchmark perf of array.find
class Objectiver
  attr_reader :number
  def initialize(number)
    @number = number
  end
end

puts "################################################################"
puts "                             OBJECTS"
puts "################################################################"
puts "making 100,000 objects"
puts res

res = Benchmark.measure do
  100000.times do |iteration|
    object = Objectiver.new(iteration)
  end
end

puts "making and assigning 100,000 objects"
puts res

res = Benchmark.measure do
  100000.times do |iteration|
    object = Objectiver.new(iteration)
    object.number
  end
end

puts "making, assigning, and calling 100,000 objects"
puts res
puts "################################################################"
puts "                             OBJECTS"
puts "################################################################"
