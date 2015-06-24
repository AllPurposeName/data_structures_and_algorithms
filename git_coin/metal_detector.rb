require 'digest/sha1'
class MetalDetector
  APPENDS = ["theclownisamurderer", "thereareotherworlds", "whowatchesthewatch", "losingisfunislosing", "ourfortunesriseandfall", "drinkdeeptheesper", "whateverhappenshappens", "DSADSADSADSADSA"]
  def initialize
    sweep
    puts "got to init"
  end

  private

  def sweep
    File.open("gold.txt", "w") do |gold|
      File.open("silver.txt", "w") do |silver|
        File.open("platinum.txt", "w") do |platinum|

          puts "got to sweep"
          1.times.map { |i|
            Thread.new {beep(0, silver, gold, platinum)};
            Thread.new {beep(1, silver, gold, platinum)};
            Thread.new {beep(2, silver, gold, platinum)};
            Thread.new {beep(3, silver, gold, platinum)};
            Thread.new {beep(4, silver, gold, platinum)};
            Thread.new {beep(5, silver, gold, platinum)};
            Thread.new {beep(6, silver, gold, platinum)};
            Thread.new {beep(7, silver, gold, platinum)};
          }.map(&:join)
          platinum.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
          gold.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
          silver.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
        end
      end
    end
  end

  def beep(iteration, silver, gold, platinum)
    1000000000.times do |i|
      num = Digest::SHA1.hexdigest(APPENDS[iteration] + i.i.to_s)
      if num.gsub(/^[0]*/).to_a.first.count("0") >= 4
        if num.gsub(/^[0]*/).to_a.first.count("0") >= 6
          platinum.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
          puts "iteration: #{i.to_s} of appender #{APPENDS[iteration]} with a score of #{num} and a gsub of #{num.gsub(/^[0]*/).to_a} "
        elsif num.gsub(/^[0]*/).to_a.first.count("0") >= 5
          gold.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
          puts "iteration: #{i.to_s} of appender #{APPENDS[iteration]} with a score of #{num} and a gsub of #{num.gsub(/^[0]*/).to_a} "
        elsif num.gsub(/^[0]*/).to_a.first.count("0") >= 4
          silver.write("#{APPENDS[iteration]}#{i.i.to_s}\n")
          puts "iteration: #{i.to_s} of appender #{APPENDS[iteration]} with a score of #{num} and a gsub of #{num.gsub(/^[0]*/).to_a} "
        end
      end
    end
    puts "got to beep #{iteration}"
  end
end

MetalDetector.new
