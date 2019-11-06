require "set"

module Slideable
  def moves
    if move_dirs == "horizontal"
      horizontal_dirs
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
    while i >= 0 || j < 8
      dirs.add([i, j])
      i += 1
      j -= 1
    end

    i, j = row, col
    while i < 8 || j >= 0
      dirs.add([i, j])
      i -= 1
      j += 1
    end
  end
  
  # private
  # @@HORIZONTAL_DIRS
  # @@DIAGONAL_DIRS
end