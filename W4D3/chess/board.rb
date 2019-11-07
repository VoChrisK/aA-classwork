require_relative "exceptions.rb"
require_relative "pieces/piece.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/king.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/rook.rb"
require_relative "pieces/null_piece.rb"

class Board
  attr_reader :rows

  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, @sentinel) }
    self[[7,0]] = Rook.new("black", self, [7,0], "Rb")
    self[[7,1]] = Knight.new("black", self, [7,1], "Nb")
    self[[7,2]] = Bishop.new("black", self, [7,2], "Bb")
    self[[7,3]] = Queen.new("black", self, [7,3], "Qb")
    self[[7,4]] = King.new("black", self, [7,4], "Kb")
    self[[7,5]] = Bishop.new("black", self, [7,5], "Bb")
    self[[7,6]] = Knight.new("black", self, [7,6], "Nb")
    self[[7,7]] = Rook.new("black", self, [7,7], "Rb")
    (0...8).each { |i| self[[6,i]] = Pawn.new("black", self, [6, i], "Pb") }

    self[[0,0]] = Rook.new("white", self, [0,0], "Rw")
    self[[0,1]] = Knight.new("white", self, [0,1], "Nw")
    self[[0,2]] = Bishop.new("white", self, [0,2], "Bw")
    self[[0,3]] = Queen.new("white", self, [0,3], "Qw")
    self[[0,4]] = King.new("white", self, [0,4], "Kw")
    self[[0,5]] = Bishop.new("white", self, [0,5], "Bw")
    self[[0,6]] = Knight.new("white", self, [0,6], "Nw")
    self[[0,7]] = Rook.new("white", self, [0,7], "Rw")
    (0...8).each { |i| self[[1,i]] = Pawn.new("white", self, [1, i], "Pw") }
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  # case 1: out of bounds
  # case 2: end_pos has a friendly piece already
  # case 3: there's a friendly piece in the path
  # case 4: the piece can't move in this pattern
  def move_piece(start_pos, end_pos)
    if !valid_pos?(end_pos) # && valid_pos?(start_pos)
      raise InvalidPOSError
    end

    if self[start_pos] == ''
      raise NoPieceFoundError
    end

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def valid_pos?(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end



  # private
  # attr_accessor :rows
end