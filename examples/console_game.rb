require_relative '../lib/snakes'

game = Snakes.standard_game(%w[James Sebastian])
text_formatter = Snakes::TextFormatter.new(game)
winner = nil

until winner
  puts text_formatter.board_text
  player = game.next_player
  print "It's your turn #{player}. Press any key to roll the dice: "
  gets.chomp
  game.move_next_player
  puts "You rolled a #{game.last_roll(player)}"
  winner = player if game.win_condition(player)
end

puts text_formatter.text
puts "#{player} wins!"
