require_relative "piece.rb"
require_relative "slideable.rb"


class Bishop < Piece
  attr_reader :pos

  include Slideable

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end