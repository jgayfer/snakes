class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def symbol_str
    @name[0].upcase
  end

  def to_s
    @name
  end
end
