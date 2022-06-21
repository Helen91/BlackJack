require "./point.rb"

class Player

  include Point

  attr_reader :cards
  attr_accessor :balance, :points

  def initialize(balance)
    @balance = balance
    @points = 0
    @cards = []
  end

  def lose?
    points > 21
  end

  def add_card(card)
    cards << card
    self.points += games_point(card, points)
  end

end