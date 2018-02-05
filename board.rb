class Board

    def initialize(dimension)
        @dimension = dimension
        @num_cells = dimension ** 2
        @current_pos = 0
        @snakes_ladders = Array.new(@num_cells)

        num_snakes = num_ladders = (dimension / 2).ceil 
        generate_snakes(num_snakes)
        generate_ladders(num_ladders)
    end

    def display_board
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
    end

    private
    def print_row(row_numbers)
        row_numbers.each do |num|
            padded_num_str = num.to_s.ljust(3, ' ')
            print "|#{padded_num_str}"
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
            @snakes_ladders[start_cell] = end_cell
        end
    end

    private 
    def generate_ladders(num_ladders)
        num_ladders.times do
            start_cell = rand(1...(@num_cells - 2))
            end_cell = rand((start_cell + 1)...(@num_cells - 1))
            @snakes_ladders[start_cell] = end_cell
        end
    end
end