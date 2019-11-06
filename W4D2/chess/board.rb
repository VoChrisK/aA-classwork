require_relative "exceptions.rb"

class Board

  def initialize
    @rows = Array.new(8) { Array.new(8, '') }
    @sentinel
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

  private
  attr_accessor :rows
end