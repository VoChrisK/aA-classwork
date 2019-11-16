class ComputerPlayer
    def initialize
        @known_cards = Hash.new { |h,k| h[k] = [] }
        @matched_pairs = []
    end

    def receive_revealed_card(pos, face_value)
        @known_cards[face_value] << pos
    end

    def return_known_card(legal_pos)
        p "hi"
        @known_cards.each {|face_value, pos| return pos.sample if pos.length == 2 && !@matched_pairs.include?(pos)}
        nil
    end

    def save_matched_pairs(pos1, pos2)
        @matched_pairs << pos1
        @matched_pairs << pos2
    end

    def get_input(legal_pos)
        pos = legal_pos.sample
        return pos
    end
end