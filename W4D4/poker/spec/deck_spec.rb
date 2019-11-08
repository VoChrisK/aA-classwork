require "deck"

describe Deck do
  subject(:d) { Deck.new }

  describe "#initialize" do
    it "should an array of 52 cards" do
      expect(d.deck.length).to eq(52)
    end
  end

  describe "shuffle_cards" do
    context "when all of the cards are unique" do
      it "should return true" do
        expect(d.shuffle_cards).to be true
      end
    end
  end
end