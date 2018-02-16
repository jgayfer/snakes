require_relative 'player_state'

class Game
  def initialize(board, player_states)
    @board = board
    @player_states = player_states
  end

  def move_next_player(num_spaces)
    current_index = current_state(next_player).index
    new_index = @board.compute_destination_index(current_index + num_spaces)
    @player_states << PlayerState.new(next_player, new_index)
  end

  def last_move_was_a_win
    @player_states.last.index == @board.winning_index
  end

  def previous_player
    @player_states.last.player
  end

  def next_player
    @player_states[-player_count].player
  end

  def current_state(player)
    @player_states.select { |p_state| p_state.player == player }.last
  end

  private

  def player_count
    @player_count ||= @player_states.uniq(&:player).size
  end
end
