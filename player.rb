# frozen_string_literal: true

class Player
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

  def strong?
    @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

  def score
    @health + @name.length
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @decreased_health = @health -= 10
  end

  def w00t
    @increased_health = @health += 15
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
