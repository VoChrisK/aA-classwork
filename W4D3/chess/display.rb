require_relative "cursor.rb"
require_relative "board.rb"
require "colorize"

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end

  def render
    counter = 0
    @cursor.board.rows.each do |row|
      row.each do |col|
        if col != NullPiece.instance
          if col.color == "black"
            color_board(col, :black, counter, @cursor.cursor_pos)
          else
            color_board(col, :white, counter, @cursor.cursor_pos)
          end
        else
          color_board(col, :white, counter, @cursor.cursor_pos)
        end
        counter += 1
      end
      puts
      counter += 1
    end
    nil
  end

  def color_board(col, color, counter, cursor_pos)
    if col.symbol.nil?
      string = "  "
    else
      string = col.symbol
    end
    if col.pos == cursor_pos
      print string.colorize(:color => color, :background => :green)
    elsif counter.even?
      print string.colorize(:color => color, :background => :light_magenta)
    else
      print string.colorize(:color => color, :background => :cyan)
    end
  end
end