class Board

    def initialize(size)
        @num_cells = size ** 2
        @current_pos = 0
        @snakes_ladders = Array.new(@num_cells)

        num_snakes = num_ladders = (size / 2).ceil 
        generate_snakes(num_snakes)
        generate_ladders(num_ladders)
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