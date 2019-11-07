require_relative "piece.rb"

class Pawn < Piece
  def move_dirs

  end

  # private
  def at_start_row?
    if @color == "black"
       pos[0] == 6
    else
      pos[0] == 1
    end
  end

  def forward_dir
    if @color == "black"
      -1
    else
      1
    end
  end

  def forward_steps
    row, col = pos
    if at_start_row?
      possible_moves = [[row + forward_dir, col], [row+forward_dir*2, col]]
    else
      possible_moves = [[row + forward_dir, col]]
    end
    possible_moves
  end

  def side_attacks
    row, col = pos
    if @color == "black"
      diagonals = [[row-1, col+1], [row-1, col-1]]
    else
      diagonals = [[row+1, col+1], [row+1, col-1]]
    end
    check_diagonals(@color, diagonals)
  end

  def check_diagonals(color, diagonals)
    diagonals.select do |diagonal|
      board.valid_pos?(diagonal) && board[diagonal] != NullPiece.instance && board[diagonal].color != color
    end
  end
end