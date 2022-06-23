require './point'

class Player
  include Point

  attr_reader :cards, :points, :name
  attr_accessor :balance

  def initialize(balance, name = 'Дилер')
    @balance = balance
    @name = name
    start_game
  end

  def lose?
    points > 21
  end

  def add_card(card)
    cards << card
    @points += games_point(card, points)
  end

  def start_game
    @points = 0
    @cards = []
  end
end
