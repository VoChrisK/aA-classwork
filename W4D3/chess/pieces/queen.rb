require_relative "piece.rb"
require_relative "../slideable.rb"

class Queen < Piece
  include Slideable 

  def move_dirs
    "both"
  end
end