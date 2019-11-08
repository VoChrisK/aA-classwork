class Card
  attr_reader :suit, :face_value, :reveal

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
    @reveal = false
  end

  def inspect
    "#{suit} #{face_value}"
  end
end