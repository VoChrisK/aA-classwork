require "towers_of_hanoi"

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "should have three towers" do
      expect(game.board.length).to eq(3)
    end

    context "when a tower has 4 disc in the beginning of the game" do
      it "should return true" do
        start = game.board.any?{|tower| tower.length == 4}
        expect(start).to be true
      end
    end
  end

end