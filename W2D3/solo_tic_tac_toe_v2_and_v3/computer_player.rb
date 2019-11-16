class ComputerPlayer
    attr_reader :mark

    def initialize(mark, playerid)
        @mark = mark
        @playerid = playerid
    end

    def get_position(legal_pos)
        random_pos = rand(0...legal_pos.length)
        pos = legal_pos[random_pos]
        puts "#{@playerid} chose position #{pos}"
        pos
    end
end