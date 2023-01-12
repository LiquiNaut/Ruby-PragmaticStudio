# frozen_string_literal: true
require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include(Playable)
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{name}'s treasures: #{@found_treasures}"
  end

  def <=>(other)
    other.score <=> score
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def score
    @health + points
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end
end

# it only runs the enclosing code if the name of the current source file (__FILE__) is the same as the name of the Ruby program file being run ($0 or $PROGRAM_NAME).
if __FILE__ == $PROGRAM_NAME
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
