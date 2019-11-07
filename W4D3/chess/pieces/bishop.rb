require_relative "piece.rb"
require_relative "../slideable.rb"


class Bishop < Piece
  attr_reader :pos

  include Slideable

  def move_dirs
    "diagonal"
  end
end

# load "bishop.rb"
# b = Bishop.new("red", "board", [2,2])
# b.diagonal_dirs