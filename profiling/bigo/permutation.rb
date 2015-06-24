require 'benchmark'
puts "################################################################"
puts "                             PERMUTATION"
puts "################################################################"

one = [1]
two = (1..2).to_a
hundred = (1..3).to_a
thousand =  (1..4).to_a
ten_thousand = (1..5).to_a
six = (1..6).to_a
seven = (1..7).to_a
eight = (1..8).to_a
nine = (1..9).to_a
ten = (1..10).to_a
twenty = (1..20).to_a
million = (1..100).to_a
Benchmark.bm do |x|
    x.report(:permutation_one) { one.permutation(one.count).to_a }
    x.report(:permutation_two) { two.permutation(two.count).to_a }
    x.report(:permutation_three) { hundred.permutation(hundred.count).to_a }
    x.report(:permutation_four) { thousand.permutation(thousand.count).to_a }
    x.report(:permutation_five) { ten_thousand.permutation(ten_thousand.count).to_a }
    x.report(:permutation_six) { six.permutation(six.count).to_a }
    x.report(:permutation_seven) { seven.permutation(seven.count).to_a }
    x.report(:permutation_eight) { eight.permutation(eight.count).to_a }
    x.report(:permutation_nine) { nine.permutation(nine.count).to_a }
    x.report(:permutation_ten) { ten.permutation(ten.count).to_a }
    x.report(:permutation_twenty) { twenty.permutation(twenty.count).to_a }
    x.report(:permutation_hundred) { million.permutation(million.count).to_a }
end


puts "################################################################"
puts "                             PERMUTATION"
puts "################################################################"
