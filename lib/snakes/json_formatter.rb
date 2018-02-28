require 'json'

module Snakes
  # This class is responsible for creating a JSON representation of a game
  # of snakes and ladders.
  class JSONFormatter
    def initialize(game)
      @game = game
    end

    def game_json
      game_hash = {}
      game_hash['board'] = board_hash
      game_hash['players'] = players_hash
      game_hash['next_player'] = @game.next_player.to_s
      game_hash['previous_player'] = @game.previous_player.to_s
      JSON.generate(game_hash)
    end

    private

    def players_hash
      players = []
      @game.players.each do |player|
        player_hash = {}
        player_hash['name'] = player.name
        player_hash['position'] = @game.position(player) + 1
        player_hash['last_roll'] = @game.last_roll(player)
        player_hash['has_won'] = @game.win_condition(player)
        players << player_hash
      end
      players
    end

    def cell_list
      cells = []
      (dimension**2).times do |index|
        cells << cell_hash(index)
      end
      cells
    end

    def board_hash
      hash = {}
      hash['cells'] = cell_list
      hash['dimension'] = @game.board.dimension
      hash['winning_position'] = @game.board.winning_index + 1
      hash
    end

    def cell_hash(index)
      hash = {}
      hash['number'] = index + 1
      hash['transition'] = transition_hash(index)
      hash['players'] = player_names(index)
      hash
    end

    def transition_hash(index)
      hash = {}
      transition = @game.board.transitions.find { |t| t.start_index == index }
      if transition
        hash['starting_position'] = transition.start_index + 1
        hash['destination_position'] = transition.dest_index + 1
      end
      hash
    end

    def player_names(index)
      @game.players_at_index(index).map(&:to_s)
    end

    def dimension
      @game.board.dimension
    end
  end
end
