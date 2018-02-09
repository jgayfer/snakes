require_relative 'game'

game = Game.new(10, ['James', 'Sebastian'])

puts "Next up: #{game.next_player_str}"
puts "Just went: #{game.previous_player_str}"
game.move_next_player(4)
puts "Next up: #{game.next_player_str}"
puts "Just went: #{game.previous_player_str}"
game.move_next_player(4)
puts "Next up: #{game.next_player_str}"
puts "Just went: #{game.previous_player_str}"
game.move_next_player(4)
puts "Next up: #{game.next_player_str}"
puts "Just went: #{game.previous_player_str}"