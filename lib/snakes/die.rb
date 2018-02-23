module Snakes
  # This class represents a die object used to determine player rolls
  class Die
    def initialize(sides)
      @range = 1..sides
    end

    def roll
      rand(@range)
    end
  end
end
