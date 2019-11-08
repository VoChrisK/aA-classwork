require "hand"

describe Hand do
  subject(:h { Hand.new}
  describe "#initialize" do
    it "should set the score value to zero" do
      expect(h.score).to eq(0)
    end

    it "should randomly select 5 cards from the deck" do
      expect(h.hand.length).to eq(5)
    end
  end

  describe "#calculate_hand" do
    it "should calculate the corresponding score" do
    end
  end
end