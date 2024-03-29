# frozen_string_literal: true

require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'
require_relative 'loaded_die'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    # number_rolled = die.roll
    #
    # if number_rolled < 3
    #   player.blam
    # elsif number_rolled < 5
    #   puts "#{player.name} was skipped"
    # else
    #   player.w00t
    # end

    case die.roll
    when 1..2
      player.blam
      puts "#{player.name} was blamed."
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.w00t
      puts "#{player.name} was w00ted."
    end

    treasure = TreasureTrove.random
    player.found_treasure(treasure)
  end
end
