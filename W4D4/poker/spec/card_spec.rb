require "card"

describe Card do
  subject(:card) { Card.new("club", "8") }

  describe "#initialize" do
    it "should have a suit" do
      expect(card.suit).to eq("club")
    end

    it "should have a face value" do
      expect(card.face_value).to eq("8")
    end

    it "should be faced down initially" do
      expect(card.reveal).to be(false)
    end
  end
end