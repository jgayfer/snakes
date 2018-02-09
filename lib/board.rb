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

  def display
    print_cells
    print_ladders
    print_snakes
  end

  def cell_is_end_of_board(cell_index)
    return true if (cell_index + 1) == @num_cells
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

  def get_row_nums(n)
    start_num = (n * @dimension) + 1
    end_num = (n * @dimension) + @dimension
    num_array = Array(start_num..end_num)

    return num_array.reverse unless n.even?
    num_array
  end

  def print_cells
    (0...@dimension).reverse_each do |n|
      print_dashed_line
      row_nums = get_row_nums(n)
      print_row(row_nums)
    end
    print_dashed_line
    puts
  end

  def print_ladders
    puts 'Ladders'
    @ladders.each_with_index do |end_cell, start_cell|
      puts "#{start_cell + 1} --> #{end_cell + 1}" if end_cell
    end
    puts
  end

  def print_snakes
    puts 'Snakes'
    @snakes.each_with_index do |end_cell, start_cell|
      puts "#{start_cell + 1} --> #{end_cell + 1}" if end_cell
    end
    puts
  end

  def print_row(row_numbers)
    row_numbers.each do |num|
      padded_cell_str = if (num - 1) == @current_pos
                          'X'.ljust(3, ' ')
                        else
                          num.to_s.ljust(3, ' ')
                        end
      print "|#{padded_cell_str}"
    end
    puts '|'
  end

  def print_dashed_line
    (@dimension * 4).times do
      print '-'
    end
    puts '-'
  end

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
