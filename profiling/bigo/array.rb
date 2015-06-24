require 'benchmark'
puts "################################################################"
puts "                             ARRAY"
puts "################################################################"

one = [1]
ten = (1..10).to_a
hundred = (1..100).to_a
thousand =  (1..1000).to_a
ten_thousand = (1..10000).to_a
hundred_thousand = (1..100000).to_a
million = (1..1000000).to_a
Benchmark.bm do |x|
  array = []
    x.report(:assign) { one.last.times {|number| array << number }  }
  array = []
    x.report(:assign) { ten.last.times {|number| array << number}  }
  array = []
    x.report(:assign) { hundred.last.times {|number| array << number}  }
  array = []
    x.report(:assign) { thousand.last.times {|number| array << number  }  }
  array = []
    x.report(:assign) { ten_thousand.last.times {|number| array << number  }  }
  array = []
    x.report(:assign) { hundred_thousand.last.times {|number| array << number }  }
  array = []
    x.report(:assign) { million.last.times {|number| array << number }  }

    x.report(:find_first) { one.find {|number| number == 1 }  }
    x.report(:find_first) { ten.find {|number| number == 1 }  }
    x.report(:find_first) { hundred.find {|number| number == 1 }  }
    x.report(:find_first) { thousand.find {|number| number == 1 }  }
    x.report(:find_first) { ten_thousand.find {|number| number == 1 }  }
    x.report(:find_first) { hundred_thousand.find {|number| number == 1} }
    x.report(:find_first) { million.find {|number| number == 1 }  }

    x.report(:find_last) { one.find {|number| number == 1 }  }
    x.report(:find_last) { ten.find {|number| number == 9 }  }
    x.report(:find_last) { hundred.find {|number| number == 99 }  }
    x.report(:find_last) { thousand.find {|number| number == 999 }  }
    x.report(:find_last) { ten_thousand.find {|number| number == 9999 }  }
    x.report(:find_last) { hundred_thousand.find {|number| number == 99999 }  }
    x.report(:find_last) { million.find {|number| number == 999999 }  }

    x.report(:binary_search) { one.bsearch {|number| number == 1 }  }
    x.report(:binary_search) { ten.bsearch {|number| number == 9 }  }
    x.report(:binary_search) { hundred.bsearch {|number| number == 99 }  }
    x.report(:binary_search) { thousand.bsearch {|number| number == 999 }  }
    x.report(:binary_search) { ten_thousand.bsearch {|number| number == 9999 }  }
    x.report(:binary_search) { hundred_thousand.bsearch {|number| number == 99999 }  }
    x.report(:binary_search) { million.bsearch {|number| number == 999999 }  }

    x.report(:nested) { one.find_all {|number| ((one.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { ten.find_all {|number| ((ten.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { hundred.find_all {|number| ((hundred.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { thousand.find_all {|number| ((thousand.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { ten_thousand.find_all {|number| ((ten_thousand.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { hundred_thousand.find_all {|number| ((hundred_thousand.each {|n| n + (n - 1)}).count % number).odd?  }  }
    x.report(:nested) { million.find_all {|number| ((million.each {|n| n + (n - 1)}).count % number).odd?  }  }
end


puts "################################################################"
puts "                             ARRAY"
puts "################################################################"
