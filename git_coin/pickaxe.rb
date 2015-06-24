        require 'pry'
require 'net/http'
require 'digest/sha1'
require_relative "dig"
class Pickaxe
  POST = URI.parse("http://git-coin.turingapps.io/hash")
  attr_accessor :append, :resp, :nuggets
  def initialize
    @nuggets = Hash.new(0)
    sell_at_store
  end

  def sell_at_store
    ["silver.txt", "gold.txt", "platinum.txt"].each do |filename|
      File.readlines(filename).each do |nugget|
        sha = digestion(nugget.chomp)
        @nuggets[sha] = nugget.chomp
      end
      @nuggets.sort.each do |hash, nugget|
        send_off(nugget)
      end
      nuggets = []
    end
  end

  def digestion(phrase)
    Digest::SHA1.hexdigest(phrase)
  end

  def send_off(sha)
    response = Net::HTTP.post_form(POST, { "message" => sha, "owner" => "Hopper Posse 4 Lyfe" })
    puts response.body
  end
end
