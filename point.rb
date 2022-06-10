module Point
  def games_point(player_cards)
    player_cards.map do |card|
      if card.to_i == 0
        10
      else
        card.to_i
      end
    end.sum
  end
end