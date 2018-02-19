require_relative 'player_state'

class Game
  attr_reader :board

  def initialize(board, player_states, rules)
    @board = board
    @player_states = player_states
    @rules = rules
  end

  def move_next_player(num_spaces)
    return puts 'Invalid roll' unless @rules.roll_is_valid(num_spaces)
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
    @rules.next_player(@player_states)
  end

  def current_state(player)
    @player_states.select { |p_state| p_state.player == player }.last
  end

  def players_at_index(index)
    current_states_of_players.select { |p_state| p_state.index == index }.map(&:player)
  end

  def current_states_of_players
    @player_states.last(players.count)
  end

  def players
    @player_states.uniq(&:player)
  end
end
