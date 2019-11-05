require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    all_moves = []
    (0..2).each do |rows|
      (0..2).each do |cols|
        # debugger
        if @board.rows[rows][cols].nil?
          new_board = []
          new_board = @board.rows.dup
          new_board[rows][cols] = :o
          all_moves << TicTacToeNode.new(new_board, :o, [rows, cols])
        end
      end
    end
    all_moves
  end

  
end
