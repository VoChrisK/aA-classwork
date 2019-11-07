require_relative "piece.rb"
require_relative "../steppable.rb"

class King < Piece
  include Steppable

  def move_diffs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end