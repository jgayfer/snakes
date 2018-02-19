require_relative 'player_state'

class Game
  attr_reader :board

  def initialize(board, player_states, rules)
    @board = board
    @move_history = player_states
    @rules = rules
  end

  def move_next_player(num_spaces)
    return puts 'Invalid roll' unless @rules.roll_is_valid(num_spaces)
    current_index = current_state(next_player).index
    new_index = @board.compute_destination_index(current_index + num_spaces)
    @move_history << PlayerState.new(next_player, new_index)
  end

  def last_move_was_a_win
    @move_history.last.index == @board.winning_index
  end

  def previous_player
    @move_history.last.player
  end

  def next_player
    current_player_states.first.player
  end

  def players_at_index(index)
    current_player_states.select { |p_state| p_state.index == index }.map(&:player)
  end

  def players
    @move_history.uniq(&:player)
  end

  private

  def current_player_states
    @move_history.last(players.count)
  end

  def current_state(player)
    @move_history.select { |p_state| p_state.player == player }.last
  end
end
