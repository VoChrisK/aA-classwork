class Board
  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  def initialize(num)
    @grid = Array.new(num) { Array.new(num, :N) }
    @size = num * num
  end

  def size
    @size
  end

  def [](pos)
    i1 = pos[0]
    i2 = pos[-1]
    @grid[i1][i2]
  end

  def []=(pos, val)
    i1 = pos[0]
    i2 = pos[-1]
    @grid[i1][i2] = val
  end

  def num_ships
    # count = 0
    # @grid.each do |sub_arr|
    #     sub_arr.each
    #  { |el| count += 1 if el == :S }
    # end
    # count

    @grid.inject(0) do |total, sub_arr|
        total += sub_arr.count { |el| el == :S }
    end
  end

   def attack(pos)
        if  self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        random_length = @size / 4
        count = 0

        until count == random_length
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] != :S
                @grid[row][col] = :S
                count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |sub_arr|
            sub_arr.map do |el| 
                 if el == :S
                     :N
                 else
                    el
                 end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(hidden_ships_grid)
    end
end
