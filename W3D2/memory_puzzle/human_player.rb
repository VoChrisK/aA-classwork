class HumanPlayer
    def initialize(name)
        @name = name
    end

    def check_and_convert(legal_pos, pos)
        raise "error" if pos.length != 2
        pos = pos.map {|el| Integer(el)}
        raise "error" if !legal_pos.include?(pos)
        return pos
    end

    def get_input(legal_pos)
        continue = false;

        until continue
            puts "Enter a position"
            pos = gets.chomp.split(" ")

            begin
                pos = check_and_convert(legal_pos, pos)
                continue = true
            rescue
                puts "Invalid position. Please try again."
            end
        end
        pos
    end

    def guess_known_card(pos, other_card)
        puts "The reveal card is #{other_card.face_value} at position #{pos[0]}, #{pos[1]}!\n"
    end
end