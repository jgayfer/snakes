require_relative 'board'

class Game
  def initialize(dimension, player_names)
    @board = Board.new(dimension)
    @players = player_names.map { |name| Player.new(name) }
  end

  def display_board
    @board.display
  end
end
