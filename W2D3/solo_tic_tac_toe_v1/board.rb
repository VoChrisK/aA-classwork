class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(pos)
        pos[0] >= 0 && pos[1] >= 0 && pos[0] < 3 && pos[1] < 3
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos, mark)
        if self.valid?(pos) && self.empty?(pos)
            self[pos] = mark
        else
            raise error
        end
    end

    def print
        @grid.each_with_index do |row, i|
            puts row.join(" | ")
            puts "---------" if i < @grid.length - 1
        end
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.uniq.length == 1 && row.uniq[0] == mark }
        false
    end

    def win_col?(mark)
        @grid.transpose.each { |row| return true if row.uniq.length == 1 && row.uniq[0] == mark }
        false
    end

    def win_diagonal?(mark)
        diag_1 = []
        diag_2 = []

        @grid.each_with_index do |row, i|
            diag_1 << row[i]
            diag_2 << row[-1-i]
        end

        (diag_1.uniq.length == 1 && diag_1.uniq[0] == mark) || (diag_2.uniq.length == 1 && diag_2.uniq[0] == mark) 
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.include?("_") }
    end
end