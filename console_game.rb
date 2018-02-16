require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/player_state'
require_relative 'lib/transition'

players = [Player.new('James'), Player.new('Sebastian')]
player_states = players.map { |player| PlayerState.new(player) }
board = Board.new([], 10)
g = Game.new(board, player_states)

until g.last_move_was_a_win
  print "It's your turn #{g.next_player}! Press any key to roll the dice: "
  gets.chomp
  move = rand(1..6)
  puts "You rolled a #{move}"
  g.move_next_player(move)
end

puts "#{g.previous_player} wins!"
