class Card
  attr_reader :value, :suit

  DIAMOND = "♦"
  HEART = "♥"
  SPADE = "♠"
  CLUB = "♣"

  def self.new_diamond(value)
    self.new(value, DIAMOND)
  end

  def self.new_heart(value)
    self.new(value, HEART)
  end

  def self.new_spade(value)
    self.new(value, SPADE)
  end

  def self.new_club(value)
    self.new(value, CLUB)
  end

  def initialize(value, suit)
    @value = value
    @suit = suit
  end
   
  def to_s
    value + " " + suit
  end
end