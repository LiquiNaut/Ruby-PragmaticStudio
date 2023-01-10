require_relative 'game'
require_relative 'player'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

car_race = Game.new("Forza")
car_race.add_player(player1)
car_race.add_player(player2)
car_race.add_player(player3)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  user_input = gets.chomp.downcase
  case user_input
  when /^\d+$/
    car_race.play(user_input.to_i)
  when 'quit', 'exit'
    car_race.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

=begin
player2.name = "Lawrence"
puts player2.name

players = [player1, player2, player3]
puts "There are #{players.size} players in the game:"

players.each do |player|
    puts player
    puts player.health
    puts player.blam
    puts player.w00t
    puts player.w00t
    puts player
end

players.pop
player4 = Player.new("Shemp", 90)
players.push(player4)

players.each do |printt|
    puts printt
end


def time()
    time = Time.new.strftime("%I:%M:%S")
end

def say_hello(players_name, players_health=100)
    "I'm #{players_name.capitalize} with a health of #{players_health} and #{time}"
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)


first_player = "larry"
second_player = "curly"
third_player = "moe"
fourth_player = "shemp"

first_player_health = 60
second_player_health = 125
third_player_health = 100
fourth_player_health = 90

#string concate
#puts first_player.capitalize + '\'s' + ' health is ' + first_player_health.to_s

#interpolated
puts "#{first_player.capitalize}'s health is #{first_player_health}"
puts "#{second_player.upcase}'s health is #{second_player_health}"

second_player_health = first_player_health
first_player_health = 30

puts "#{first_player.capitalize}'s health is #{first_player_health}"
puts "#{second_player.upcase}'s health is #{second_player_health}"
puts "#{third_player.upcase}'s health is #{third_player_health}".center(50, '*')
puts "#{fourth_player.upcase.ljust(40, '*')}#{fourth_player_health} health"

#\n - new line, \t - tab
puts "Players: \n\t#{first_player}\n\t#{second_player}\n\t#{third_player}"

puts "The game started on #{Time.now.strftime("%A %m/%d/%Y at %I:%M%p")}"
=end