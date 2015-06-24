require 'benchmark'

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
