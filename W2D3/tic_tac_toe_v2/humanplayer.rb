class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        return @mark
    end

    def get_position
        numbers = ("0".."100").to_a
        puts "Enter a row and col to place your"
        puts "Mark with a space between numbers(Ex. 0 2): "
        
        pos = gets.chomp.split(" ")
        pos.each { |ele| raise "error" if !numbers.include?(ele) }
        if pos.length != 2
            raise "error"
        end

        return pos.map(&:to_i)
    end
end

human = HumanPlayer.new(:X)
# human.get_position