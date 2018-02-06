require_relative 'board'

game = Board.new(5)

until game.win_condition
  game.display_board
  print 'Press any key to roll the dice: '
  gets.chomp
  move = rand(1..6)
  puts "You rolled #{move}"
  puts
  game.make_move(move)
end

game.display_board
puts 'You win!'
