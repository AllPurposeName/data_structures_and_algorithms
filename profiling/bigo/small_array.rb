require 'benchmark'


Benchmark.bm do |x|
  x.report(:fifty) { 50.times { a = "1" } }
  x.report(:perm) { [1,2,3].permutation.to_a }
end

