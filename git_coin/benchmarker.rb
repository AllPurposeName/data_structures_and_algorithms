require 'net/http'
require 'digest/sha1'
require 'benchmark'
include Benchmark

string = "0000000akjsdflkajsdflkajsd"
Benchmark.bmbm do |x|
  x.report("to arr then include?:") { 1000000.times {[string[(0..7)]].include?("0000000") }}
  x.report("to arr then include?:") { 1000000.times {string[(0..7)].count("0") }}
end
