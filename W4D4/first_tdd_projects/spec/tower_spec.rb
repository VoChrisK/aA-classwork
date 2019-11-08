require "tower"

describe Tower do
  subject(:tower) { Tower.new }

  describe "#initialize" do
    it "should set the pile array" do
      expect(tower.pile).to eq([])
    end
  end

  describe "#add_disc" do

    it "should add disc to the pile" do
      tower.add_disc(1)
      expect(tower.pile).to eq([1])
    end
  end
end
