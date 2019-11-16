class HumanPlayer
    attr_reader :mark, :playerid

    def initialize(mark, playerid)
        @mark = mark
        @playerid = playerid
    end

    def check_input(pos)
        raise "error" if pos.length != 2

        pos.each {|num| Integer(num)}
    end


    def get_position
        puts "#{playerid}, enter two numbers in the format 'row col'"
        pos = gets.chomp.split(" ")
        
        begin
            self.check_input(pos)
            pos.map(&:to_i)
        rescue
            puts "Invalid Input."
        end
    end
end