require "digest/sha1"
require_relative "dig"
class MinersRun
  def initialize
    puts "got to init"
    command
  end

  private

  def command
    puts "got to command"
    1.times.map { |i|
      Thread.new {(Dig.new("a"))};
      Thread.new {(Dig.new("b"))};
      Thread.new {(Dig.new("c"))};
      Thread.new {(Dig.new("d"))};
      Thread.new {(Dig.new("e"))};
    }.map(&:join)
    command
  end
end

MinersRun.new
