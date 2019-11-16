class Board
    def initialize()
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def valid?(pos)
        if @grid[pos[0]][pos[-1]] != "_"
            raise "error"
        end

        if (pos[0] < @grid.length && pos[-1] < @grid.length) && (pos[0] >= 0 && pos[1] >= 0)
            return true
        end

        false
    end

    def empty?(pos)
        if pos == []
            return true
        else
            return false
        end
    end

    def place_mark(pos, mark)
        if  !self.empty?(pos) && self.valid?(pos) 
            @grid[pos[0]][pos[-1]] = mark
        else 
            raise "error"
        end
    end

    def print
        @grid.each { |sub_arr| p sub_arr }
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.uniq.length == 1 && mark == row.uniq[0]
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |row|
            row.uniq.length == 1 && mark == row.uniq[0]
        end
    end

    def win_diagonal?(mark)
        diagonal_1 = []
        diagonal_2 = []
        @grid.each_with_index do |row, i|
            diagonal_1 << row[i]
            diagonal_2 << row[-1 - i]
        end
        (diagonal_1.uniq.length == 1 && mark == diagonal_1.uniq[0])|| (diagonal_2.uniq.length == 1 && mark == diagonal_2.uniq[0])
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        count = 0
        @grid.each do |sub_arr|
            sub_arr.each { |ele| count += 1 if ele == "_"}
        end
        if count > 0
            return true
        else
            return false
        end
    end
end

# p board = Board.new()
# # p board.valid?([1,2])
# # p board.empty?([2])
# # p board.place_mark([], "mark")
# # board.print
# p board.place_mark([0,0], :X)
# p board.place_mark([0,1], :X)
# p board.place_mark([0,2], :X)
# p board.place_mark([1,0], :X)
# p board.place_mark([1,1], :X)
# p board.place_mark([1,2], :X)
# p board.place_mark([2,0], :X)
# p board.place_mark([2,1], :X)
# p board.place_mark([2,2], :X)
# board.print
# # p board.win?(:O)
# p board.empty_positions?