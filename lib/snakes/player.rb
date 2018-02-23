module Snakes
  # This class represents a player that can participate in a game of
  # snakes and ladders
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def to_s
      @name
    end
  end
end
