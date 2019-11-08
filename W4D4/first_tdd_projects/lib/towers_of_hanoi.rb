require_relative "tower.rb"
class TowersOfHanoi
  def initialize
    @board = Array.new(3) {Tower.new}
    
    @board
  end
end