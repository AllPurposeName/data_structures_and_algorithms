require 'benchmark'
require 'pry'
class Primer


  def priming(raw_number)
    numbers = (2..raw_number)
    numbers.select do |number|
      ((Math.sqrt(number).to_i)...number).one? do |num|
        if number % num == 0 then numbers.reject{|n| n % num == 0}
          return true
        end
      end
      end
  end
  #
  # def is_prime?(number)
  #   raw_numbers.one? do |num|
  #     number % num == 0
  #   end
  # end

end


primes = Primer.new
bm = Benchmark.measure do
  primes.priming(25_000)
end
puts bm
