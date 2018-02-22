module Snakes
  class TextFormatter
    def initialize(game)
      @game = game
    end

    def board_text
      row_strings = []
      (0..(dimension - 1)).reverse_each do |row_num|
        row_strings << row_str(row_num)
      end
      row_strings.join("\n\n")
    end

    private

    def row_str(row_num)
      square_strings = []
      dimension.times do |index|
        square_strings << square_str(index + row_num * 10)
      end
      square_strings.join(' | ').prepend('| ') << ' |'
    end

    def square_str(index)
      square_num = index + 1
      transition = @game.board.transitions.find { |t| t.start_index == index }
      players = @game.players_at_index(index) || []

      " #{format_square_num(square_num)}" \
      " #{format_players(players)}" \
      " #{format_transition(transition)} "
    end

    def format_square_num(square_num)
      square_num.to_s.ljust(max_digit_count)
    end

    def format_transition(transition)
      if transition
        dest_index_str = (transition.dest_index + 1).to_s.ljust(max_digit_count)
        "#{transition_symbol(transition)}->#{dest_index_str}"
      else
        ''.ljust(max_digit_count + 3)
      end
    end

    def format_players(players)
      players.map { |player| player_symbol(player) } \
             .join.ljust(@game.players.count)
    end

    def transition_symbol(transition)
      transition.start_index > transition.dest_index ? 'S' : 'L'
    end

    def player_symbol(player)
      player.name[0].upcase
    end

    def max_digit_count
      (@game.board.winning_index + 1).to_s.size
    end

    def dimension
      @game.board.dimension
    end
  end
end
