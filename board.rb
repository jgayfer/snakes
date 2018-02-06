class Board

    def initialize(dimension)
        @dimension = dimension
        @num_cells = dimension ** 2
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
            raise ArgumentError.new("Number must be greater than zero")
        end

        @current_pos += num_spaces
        if current_pos_is_ladder
            @current_pos = @ladders[@current_pos]
        elsif current_pos_is_snake
            @current_pos = @snakes[@current_pos]
        end

        if @current_pos > (@num_cells - 1)
            @current_pos = (@num_cells - 1)
        end
    end

    def win_condition
        if @current_pos == (@num_cells - 1)
           return true 
        end
    end

    private
    def current_pos_is_snake
        if @snakes[@current_pos]
            return true
        end
    end

    private
    def current_pos_is_ladder
        if @ladders[@current_pos]
            return true
        end
    end

    private
    def print_cells
        (0...@dimension).reverse_each do |n|
            start_num = (n * @dimension) + 1
            end_num = (n * @dimension) + @dimension
  
            if n % 2 == 0
                row_numbers = Array (start_num..end_num)
            else
                row_numbers = (Array (start_num..end_num)).reverse
            end
            
            print_dashed_line
            print_row(row_numbers)
        end
        print_dashed_line
        puts
    end

    private
    def print_ladders
        puts "Ladders"
        @ladders.each_with_index do |end_cell, start_cell|
            if end_cell
                puts "#{start_cell + 1} --> #{end_cell + 1}"
            end
        end
        puts
    end

    private
    def print_snakes
        puts "Snakes"
        @snakes.each_with_index do |end_cell, start_cell|
            if end_cell
                puts "#{start_cell + 1} --> #{end_cell + 1}"
            end
        end
        puts
    end

    private
    def print_row(row_numbers)
        row_numbers.each do |num|
            if (num - 1) == @current_pos
                padded_cell_str = 'X'.ljust(3, ' ')
            else
                padded_cell_str = num.to_s.ljust(3, ' ')
            end
            print "|#{padded_cell_str}"
        end
        puts '|'
    end

    private
    def print_dashed_line
        (@dimension * 4).times do
            print '-'
        end
        puts '-'
    end

    private
    def generate_snakes(num_snakes)
        num_snakes.times do
            start_cell = rand(1...(@num_cells - 1))
            end_cell = rand(0...start_cell)
            @snakes[start_cell] = end_cell
        end
    end

    private 
    def generate_ladders(num_ladders)
        num_ladders.times do
            start_cell = rand(1...(@num_cells - 2))
            end_cell = rand((start_cell + 1)...(@num_cells - 1))
            @ladders[start_cell] = end_cell
        end
    end
end