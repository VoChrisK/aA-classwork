require_relative "board.rb"
require_relative "computer_player.rb"
require_relative "human_player.rb"

class Game
    def initialize(num)
        @board = Board.new(num)
        @player = ComputerPlayer.new()
        @previous_guess = nil
        @previous_pos = []
        @num_of_turns = 0
    end

    def show_board_state
        system("clear")
        @board.render
    end

    def play
        @board.populate
        until @board.won?
            self.show_board_state
            legal_pos = @board.get_legal_positions
            pos = @player.get_input(legal_pos)
            self.make_guess(legal_pos, pos)
        end
        self.show_board_state
        puts "You win!"
        puts "That took #{@num_of_turns} turns!"
    end

    def validate_pos(legal_pos, pos)
        pos = @player.return_known_card(legal_pos) || pos
        until legal_pos.include?(pos)
            pos = @player.return_known_card(legal_pos) || pos
        end
        pos
    end

    def make_guess(legal_pos, pos)
        other_card = @board.reveal(pos)
        @player.receive_revealed_card(pos, other_card.face_value)
        pos = self.validate_pos(legal_pos, pos)
        if @previous_guess.nil?
            @previous_guess = other_card
            @previous_pos = pos
        else
            if @previous_guess == other_card
                @player.save_matched_pairs(pos, @previous_pos)
            else
                self.show_board_state
                sleep(2)
                @previous_guess.hide
                other_card.hide
            end
            @num_of_turns += 1
            @previous_guess = nil
            @previous_pos = []
        end
    end

end