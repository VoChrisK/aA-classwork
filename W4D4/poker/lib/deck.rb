class Deck
  attr_reader :deck

  def initialize
    @deck = []
    shuffle_cards
  end

  def shuffle_cards
    suit = ["heart", "club", "spade", "diamond"]
    face_value = ["A", "2", "3", "4", "5","6", "7", "8", "9", "10", "J", "Q", "K"]
    pairs = suit.product(face_value)
    pairs.each do |pair|
      deck << Card.new(pair[0],pair[1])
    end
    true
  end
end