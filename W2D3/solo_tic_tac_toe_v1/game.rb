require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(p1_mark, p2_mark)
        @p1 = HumanPlayer.new(p1_mark, "Player 1")
        @p2 = HumanPlayer.new(p2_mark, "Player 2")
        @board = Board.new
        @current = @p1
    end

    def switch_turn
        if @current == @p1
            @current = @p2
        else
            @current = @p1
        end
    end

    def play
        until !@board.empty_positions?
            @board.print
            pos = @current.get_position
            if pos.nil?
                next
            else
                begin 
                    @board.place_mark(pos, @current.mark)
                    if @board.win?(@current.mark)
                        puts "#{@current.playerid} has won!"
                        return
                    else
                        self.switch_turn
                    end
                rescue
                    puts "Invalid Position or Position occupied."
                end
            end
        end

        @board.print
        puts "Draw."
    end
end

game = Game.new(:O, :X)
game.play