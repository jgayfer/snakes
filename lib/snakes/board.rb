module Snakes
  class Board
    attr_reader :dimension, :transitions

    def initialize(transitions, dimension)
      @dimension = dimension
      @transitions = transitions
    end

    def compute_destination(initial_position)
      transition = @transitions.find { |t| t.start_index == initial_position }
      new_position = transition&.dest_index || initial_position
      [new_position, winning_index].min
    end

    def winning_index
      @dimension**2 - 1
    end
  end
end
