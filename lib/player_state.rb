class PlayerState
  attr_reader :player, :index

  def initialize(player, index = 0)
    @player = player
    @index = index
  end
end
