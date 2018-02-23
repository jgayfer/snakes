module Snakes
  # This class represents a game board transition (usually referred to as
  # a snake or ladder)
  class Transition
    attr_reader :start_index, :dest_index

    def initialize(start_index, dest_index)
      @start_index = start_index
      @dest_index = dest_index
    end
  end
end
