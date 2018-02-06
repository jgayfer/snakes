class Board
  def initialize(dimension)
    @dimension = dimension
    @num_cells = dimension**2
    @current_pos = 0
    @snakes = Array.new(@num_cells)
    @ladders = Array.new(@num_cells)

    num_snakes = num_ladders = (dimension / 2).ceil
    generate_snakes(num_snakes)
    generate_ladders(num_ladders)
  end

  def display_board
    print_cells
    print_ladders
    print_snakes
  end

  def make_move(num_spaces)
    unless num_spaces > 0
      raise ArgumentError, 'Number must be greater than zero'
    end
    update_current_pos(num_spaces)
  end

  def win_condition
    @current_pos == (@num_cells - 1)
  end

  private

  def update_current_pos(num_spaces)
    @current_pos += num_spaces

    if current_pos_is_ladder
      @current_pos = @ladders[@current_pos]
    elsif current_pos_is_snake
      @current_pos = @snakes[@current_pos]
    end

    @current_pos = (@num_cells - 1) if @current_pos > (@num_cells - 1)
  end

  def current_pos_is_snake
    true if @snakes[@current_pos]
  end

  def current_pos_is_ladder
    true if @ladders[@current_pos]
  end

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
