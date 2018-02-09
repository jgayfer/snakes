require_relative 'lib/game'

g = Game.new(10, %w[James Sebastian Clarke])

until g.last_move_was_a_win
  g.display_board
  print "It's your turn #{g.next_player}! Press any key to roll the dice: "
  gets.chomp
  move = rand(1..6)
  puts "You rolled a #{move}"
  puts
  g.move_next_player(move)
end

g.display_board
puts "#{g.previous_player} wins!"
