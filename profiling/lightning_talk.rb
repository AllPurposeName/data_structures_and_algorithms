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
puts "                             ARRAY"
puts "################################################################"

array = (1..1_000_000).to_a

res = Benchmark.measure do
  array.find { |i| i == (array.length - 3) }
end
puts "benchmarking finding element in an array of 1"
print res


array = (1..10_000_000).to_a

res = Benchmark.measure do
  array.find { |i| i == (array.length - 3) }
end

puts "benchmarking finding element in an array of 10mil"
puts res
puts "################################################################"
puts "                             ARRAY"
puts "################################################################"

puts "################################################################"
puts "                             HASH"
puts "################################################################"
hash = {}
puts "benchmarking adding 10 items to a hash"
res = Benchmark.measure do
  10.times do |i|
    hash[i.to_s] = i
  end
end
puts res

hash = {}
puts "benchmarking adding 1000 items to a hash"
res = Benchmark.measure do
  1_000.times do |i|
    hash[i.to_s] = i
  end
end
puts res

hash = {}
puts "benchmarking adding 1mil items to a hash"
res = Benchmark.measure do
  1_000_000.times do |i|
    hash[i.to_s] = i
  end
end
puts res


puts "benchmarking fetching element from a hash of 10"
res = Benchmark.measure do
  hash.fetch(9009.to_s)
end
puts res


puts "benchmarking fetching element from a hash of 10"
res = Benchmark.measure do
  hash.fetch(9.to_s)
end
puts res
puts "################################################################"
puts "                             HASH"
puts "################################################################"


puts "################################################################"
puts "                             FILE IO"
puts "################################################################"
puts "time to read File from file system"
res = Benchmark.measure do
  File.read("/usr/share/dict/words")
end
puts res

puts "time to read 1_000 Files from file system"
res = Benchmark.measure do
  1_000.times do
    File.read("/usr/share/dict/words")
  end
end
puts res
puts "################################################################"
puts "                             FILE IO"
puts "################################################################"

puts "################################################################"
puts "                             OPEN STRUCT"
puts "################################################################"
res = Benchmark.measure do
  100000.times do
    OpenStruct.new({benchmarking: "is fun"})
  end
end

puts "making 100,000 openstructs"
puts res


res = Benchmark.measure do
  100000.times do
    Hash.new({benchmarking: "is fun"})
  end
end

puts "making 100,000 hashes"
puts res

res = Benchmark.measure do
  100000.times do
    OpenStruct.new({benchmarking: "is fun"})
  end
end

puts "making 100,000 openstructs"
puts res


res = Benchmark.measure do
  100000.times do |iteration|
    Objectiver.new(iteration)
  end
end
puts "################################################################"
puts "                             OPEN STRUCT"
puts "################################################################"

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
