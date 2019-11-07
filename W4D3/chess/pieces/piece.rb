require_relative "../board.rb"

class Piece
  attr_accessor :color, :board, :pos, :symbol

  def initialize(color, board, pos, symbol)
    @color = color
    @board = board
    @pos = pos
    @symbol = symbol
    @board.add_piece(self, @pos)
  end

  def inspect
    @symbol.inspect
  end
  
end