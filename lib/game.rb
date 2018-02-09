require_relative 'board'
require_relative 'player'

class Game
  def initialize(dimension, player_names)
    @board = Board.new(dimension)
    @players = player_names.map { |name| Player.new(name) }
    @player_positions = Array.new(@players.size, 0)
    @next_player_index = 0
    @previous_player_index = nil
  end

  def display_board
    @board.display
  end

  def move_next_player(num_spaces)
    new_position = @player_positions[@next_player_index] + num_spaces
    @player_positions[@next_player_index] = @board.cell_destination(new_position)
    update_next_player_index
    update_previous_player_index
  end

  def next_player_str
    @players[@next_player_index].name
  end

  def previous_player_str
    @players[@previous_player_index].name if @previous_player_index
  end

  def last_move_was_a_win
    @board.cell_is_end_of_board(@player_positions[@previous_player_index])
  end

  private

  def update_next_player_index
    if (@next_player_index + 1) == num_of_players
      @next_player_index = 0
    else
      @next_player_index += 1
    end
  end

  def update_previous_player_index
    unless @previous_player_index
      @previous_player_index = 0
      return
    end

    if (@previous_player_index + 1) == num_of_players
      @previous_player_index = 0
    else
      @previous_player_index += 1
    end
  end

  def num_of_players
    @players.size
  end
end
