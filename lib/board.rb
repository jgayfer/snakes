class Board
  def initialize(dimension)
    @dimension = dimension
    @num_cells = dimension**2
    @snakes = Array.new(@num_cells)
    @ladders = Array.new(@num_cells)

    num_snakes = num_ladders = (dimension / 2).ceil
    generate_snakes(num_snakes)
    generate_ladders(num_ladders)
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

  private


  def generate_snakes(num_snakes)
    num_snakes.times do
      start_cell = rand(1...(@num_cells - 1))
      end_cell = rand(0...start_cell)
      @snakes[start_cell] = end_cell
    end
  end

  def generate_ladders(num_ladders)
    num_ladders.times do
      start_cell = rand(1...(@num_cells - 2))
      end_cell = rand((start_cell + 1)...(@num_cells - 1))
      @ladders[start_cell] = end_cell
    end
  end
end
