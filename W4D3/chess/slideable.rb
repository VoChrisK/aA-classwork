require "set"

module Slideable
  def moves
    case move_dirs
    when "horizontal"
      horizontal_dirs
    when "diagonl"
      diagonal_dirs
    when "both"
      horizontal_dirs
      diagonal_dirs
    end
  end

  def move_dirs
    ""
  end

  def horizontal_dirs
    dirs = Set.new
    row, col = pos
    (0...8).each do |i|
      dirs.add([row, i])
      dirs.add([i, col])
    end
    dirs.delete(pos)
    dirs
  end

  def diagonal_dirs
    dirs = Set.new
    row, col = pos
    i, j = row, col
    
    while i < 8 || j < 8
      dirs.add([i, j])
      i += 1
      j += 1
    end

    i, j = row, col
    while i >= 0 || j >= 0
      dirs.add([i, j])
      i -= 1
      j -= 1
    end

    i, j = row, col
    while i >= 0 && j < 8
      dirs.add([i, j])
      i -= 1
      j += 1
    end

    i, j = row, col
    while i < 8 && j >= 0
      dirs.add([i, j])
      i += 1
      j -= 1
    end
    dirs
  end
  
  # private
  # @@HORIZONTAL_DIRS
  # @@DIAGONAL_DIRS
end