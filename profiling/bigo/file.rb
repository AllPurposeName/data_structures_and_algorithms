require 'benchmark'
puts "################################################################"
puts "                             FILE"
puts "################################################################"

one = 1
ten = 10
hundred = 20
thousand =  30
ten_thousand = 40
hundred_thousand = 50
million = 100

Benchmark.bm do |x|
    x.report(:read) { one.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:read) { ten.times {|number| File.readlines("/usr/share/dict/words")  }  }
    x.report(:read) { hundred.times {|number| File.readlines("/usr/share/dict/words")  }  }
    x.report(:read) { thousand.times {|number| File.readlines("/usr/share/dict/words") } }
    x.report(:read) { ten_thousand.times {|number| File.readlines("/usr/share/dict/words") } }
    x.report(:read) { hundred_thousand.times {|number| File.readlines("/usr/share/dict/words") } }
    x.report(:read) { million.times {|number| File.readlines("/usr/share/dict/words") } }

    x.report(:write) { one.times {|number| File.write("./filer", File.open("/usr/share/dict/words"))  }  }
    x.report(:write) { ten.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }
    x.report(:write) { hundred.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }
    x.report(:write) { thousand.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }
    x.report(:write) { ten_thousand.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }
    x.report(:write) { hundred_thousand.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }
    x.report(:write) { million.times {|number| File.write("./filer", File.open("/usr/share/dict/words")) }  }

    x.report(:readlines) { one.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:readlines) { ten.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:readlines) { hundred.times {|number|File.readlines("/usr/share/dict/words")  }  }
    x.report(:readlines) { thousand.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:readlines) { ten_thousand.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:readlines) { hundred_thousand.times {|number| File.readlines("/usr/share/dict/words") }  }
    x.report(:readlines) { million.times {|number| File.readlines("/usr/share/dict/words")}  }
end
puts "################################################################"
puts "                             FILE"
puts "################################################################"
