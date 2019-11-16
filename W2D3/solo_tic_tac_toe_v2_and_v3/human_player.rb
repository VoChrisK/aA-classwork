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


    def get_position(legal_pos)
        flag = false
        until flag
            puts "#{playerid}, enter two numbers in the format 'row col'"
            pos = gets.chomp.split(" ")
        
            begin
                self.check_input(pos)
                pos = pos.map(&:to_i)
                if legal_pos.include?(pos)
                    flag = true
                else
                    puts "#{pos} is not a legal position"
                end
            rescue
                puts "Invalid Input."
            end
        end
        pos
    end
end