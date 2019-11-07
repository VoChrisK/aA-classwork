module Steppable
  def moves
    coordinates = move_diffs
    next_pos = []
    coordinates.each do |coordinate|
      next_pos << [pos[0] - coordinate[0], pos[1] - coordinate[1]]
    end
    next_pos
  end

  def legal_moves
    pot_moves = moves
    pot_moves.select do |move|
      board.valid_pos?(move) && board[move].color != color
    end
  end

  def move_diffs
    
  end
end