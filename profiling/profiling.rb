require "benchmark"
require "ostruct"
# Benchmark perf of array.find


array = (1..1_000_000).to_a

res = Benchmark.measure do
  array.find { |i| i == (array.length - 3) }
end

puts "benchmarking finding element in an array of 1"
puts res


array = (1..10_000_000).to_a

res = Benchmark.measure do
  array.find { |i| i == (array.length - 3) }
end

puts "benchmarking finding element in an array of 10mil"
puts res

hash = {}

puts "will add 1mil items to a hash"
1_000_000.times do |i|
  hash[i.to_s] = i
end


res = Benchmark.measure do
  hash.fetch(9009.to_s)
end

puts "benchmarking fetching element from a hash of 10"
puts res


puts "will add 10 items to a hash"
10.times do |i|
  hash[i.to_s] = i
end


res = Benchmark.measure do
  hash.fetch(9.to_s)
end

puts "benchmarking fetching element from a hash of 10"
puts res



puts "FILE IO"


res = Benchmark.measure do
  File.read("/usr/share/dict/words")
end

puts "time to read FIle from file system"
puts res

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
