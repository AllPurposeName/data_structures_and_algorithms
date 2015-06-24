require 'benchmark'

puts "################################################################"
puts "                             HASH"
puts "################################################################"

one = 1
ten = 10
hundred = 100
thousand =  1000
ten_thousand = 10000
hundred_thousand = 100000
million = 1000000

hash1 = {}
hash2 = {}
hash3 = {}
hash4 = {}
hash5 = {}
hash6 = {}
hash7 = {}
Benchmark.bm do |x|

  x.report(:assign) { one.times {|number| hash1[number.to_s] = number }  }
  x.report(:assign) { ten.times {|number| hash2[number.to_s] = number}  }
  x.report(:assign) { hundred.times {|number| hash3[number.to_s] = number}  }
  x.report(:assign) { thousand.times {|number| hash4[number.to_s] = number  }  }
  x.report(:assign) { ten_thousand.times {|number| hash5[number.to_s] = number  }  }
  x.report(:assign) { hundred_thousand.times {|number| hash6[number.to_s] = number }  }
  x.report(:assign) { million.times {|number| hash7[number.to_s] = number }  }

  x.report(:fetch) { hash1.fetch(0.to_s)   }
  x.report(:fetch) { hash2.fetch(8.to_s)  }
  x.report(:fetch) { hash3.fetch(98.to_s)  }
  x.report(:fetch) { hash4.fetch(998.to_s)  }
  x.report(:fetch) { hash5.fetch(9998.to_s)  }
  x.report(:fetch) { hash6.fetch(99998.to_s)  }
  x.report(:fetch) { hash7.fetch(999998.to_s)  }
end
puts "################################################################"
puts "                             HASH"
puts "################################################################"

