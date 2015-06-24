require 'net/http'
require 'digest/sha1'
require_relative "pickaxe"

class Dig
  attr_reader :tag
  POST = URI.parse("http://git-coin.turingapps.io/hash")
  def initialize(tag)
    @tag = tag
    run
  end

  def run
    key = (1..30000).to_a.sample.to_s + "Grace Hopper's Ghost"
    target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target")).hex
    loop do
      100_000_000_000.times do |i|
        sha = key + i.to_s
        if i % 1_000_000 == 0
          target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target"))
        end
        if Digest::SHA1.hexdigest(sha).hex < target.hex
          Net::HTTP.post_form(POST, { "message" => sha, "owner" => "Hopper Posse 4 Lyfe" })
          target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target"))
          break
        end
      end
    end
  end
end
