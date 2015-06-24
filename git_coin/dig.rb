require 'net/http'
require 'digest/sha1'
require_relative "pickaxe"

class Dig
  attr_reader :tag
  POST = URI.parse("http://git-coin.turingapps.io/hash")
  def initialize(tag)
    @tag = tag
    puts "miner got to init"
    run
  end

  def run
    puts "miner got to run"
    key = (1..30000).to_a.sample.to_s + "Grace Hopper's Ghost"
    target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target")).hex
    if target[0] == "F" || target[0] == "f"
      Pickaxe.new
    end
    loop do
      100_000_000_000.times do |i|
        sha = key + i.to_s
        if i % 1_000_000 == 0
          puts "#{tag} at iteration #{i}"
          target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target"))
          if target[0] == "F" || target[0] == "f"
            Pickaxe.new
          end
        end
        if Digest::SHA1.hexdigest(sha).hex < target.hex
          response = Net::HTTP.post_form(POST, { "message" => sha, "owner" => "Hopper Posse 4 Lyfe" })
          target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target"))
          puts "#{sha} is just got #{response.body}"
          break
        end
      end
    end
  end
end
