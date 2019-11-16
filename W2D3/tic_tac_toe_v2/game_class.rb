require_relative "board.rb"
require_relative "humanplayer.rb"

class Game
    def initialize(n, *players_mark)
        i = 0
        @players= []
        while i < players_mark.length
            puts "type your symbol: "
            mark = gets.chomp
            @players << HumanPlayer.new(mark)
            i += 1
        end
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        1.times do
            @players.rotate!
        end
    end
    
    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts @currentplayer
                puts " has won!"
                return true
            else
                self.switch_turn
            end
        
        
        end
        puts "Draw!"
        false
    end

end

game = Game.new(:x, :o)