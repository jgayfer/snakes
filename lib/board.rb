class Board
  def initialize(dimension)
    @dimension = dimension
    @num_cells = dimension**2
    @snakes = Array.new(@num_cells)
    @ladders = Array.new(@num_cells)

  end


  def end_of_board
    @num_cells - 1
  end

  def cell_is_snake(cell_index)
    return true if @snakes[cell_index]
  end

  def cell_is_ladder(cell_index)
    return true if @ladders[cell_index]
  end

  def cell_destination(cell_index)
    if cell_is_ladder(cell_index)
      @ladders[cell_index]
    elsif cell_is_snake(cell_index)
      @snakes[cell_index]
    else
      cell_index
    end
  end

end
