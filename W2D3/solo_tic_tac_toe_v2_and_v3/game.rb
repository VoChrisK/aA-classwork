require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game # 
    def initialize(n, *marks)
        @players = []
        humanCounter = 1
        computerCounter = 1
        marks[0].each do |mark, type|
            if type == false #if it is a human player 
                @players << HumanPlayer.new(mark, "Player #{humanCounter}")
                humanCounter += 1
            else
                @players << ComputerPlayer.new(mark, "Computer #{computerCounter}")
                computerCounter += 1
            end
        end
        @board = Board.new(n)
    end

    def switch_turn
        @players.rotate!
    end

    def play
        until !@board.empty_positions?
            @board.print
            legal_pos = @board.legal_positions
            pos = @players[0].get_position(legal_pos)
            @board.place_mark(pos, @players[0].mark)
            if @board.win?(@players[0].mark)
                @board.print
                puts "#{@players[0].playerid} has won!"
                return
            else
                self.switch_turn
            end
        end

        @board.print
        puts "Draw."
    end
end

# game = Game.new(:O, :X)
# game.play