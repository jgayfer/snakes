require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/player_state'
require_relative 'lib/transition'
require_relative 'lib/rules/standard_rules'
require_relative 'lib/console_printer'
require_relative 'lib/die'

players = [Player.new('James'), Player.new('Sebastian')]
player_states = players.map { |player| PlayerState.new(player) }
board = Board.new([Transition.new(5, 50), Transition.new(87, 25)], 10)

d6 = Die.new(6)
rules = StandardRules.new(d6)

g = Game.new(board, player_states, rules)
p = ConsolePrinter.new(g)

until g.last_move_was_a_win
  player = g.next_player
  p.display_board
  print "It's your turn #{player}! Press any key to roll the dice: "
  gets.chomp
  g.move_next_player
  puts "You rolled a #{g.last_roll(player)}"
end

p.display_board
puts "#{player} wins!"
