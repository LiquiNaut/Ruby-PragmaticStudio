# frozen_string_literal: true

require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(a_player)
    @players << a_player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        puts player
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong_players = @players.select { |player| player.strong? }
    week_players = @players.reject { |player| player.strong?}

    # strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"

    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{week_players.size} wimpy players:"
    week_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end


    puts "\n#{@title} High Scores: "
    @players.sort.each do |sortplayers|
      puts "#{sortplayers.name.ljsut(20, '.')} #{sortplayers.score}"
    end
  end

end
