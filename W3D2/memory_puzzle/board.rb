require_relative "card.rb"

class Board
    def initialize(size)
        @grid = Array.new(size){Array.new(size)}
        @size = size
    end

    def [](pos)
        @grid[pos[0]][pos[-1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[-1]] = val
    end

    def randomize_pair(pair)
        i = rand(0...@grid.length)
        j = rand(0...@grid.length)
        if @grid[i][j].nil?
            @grid[i][j] = Card.new(pair)
            return true
        else
            return false
        end
    end

    def randomize(pair)
        until self.randomize_pair(pair)
            next
        end
    end

    def populate
        alphabet = ("A".."Z").to_a
        num_of_pairs = (@size * @size) / 2
        pairs = alphabet.sample(num_of_pairs) #same as num_of_pairs.times {pairs << alphabet.sample}

        while pairs.length > 0
            pair = pairs.pop
            2.times { self.randomize(pair) }
        end
    end

    def format(ele)
        print ele
        print " "
    end

    def render
        print "  "
        (0...@size).each do |i|
            self.format(i)
        end

        puts

        @grid.each_with_index do |row, i|
            self.format(i)
            row.each do |el|
                self.format(el.to_s)
            end
            puts
        end
    end

    def won?
        @grid.all? do |row|
            row.all? do |el|
                el.face_up == true
            end
        end
    end

    def reveal(guessed_pos)
        if self[guessed_pos].face_up != true
            self[guessed_pos].reveal
            return self[guessed_pos]
        end
    end

    def get_legal_positions
        legal_pos = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |el, j|
                if el.face_up == false
                    legal_pos << [i, j]
                end
            end
        end
        legal_pos
    end
end