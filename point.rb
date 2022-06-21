module Point
  def games_point(card, current_points)
    if card[0] == "A"
      sum = current_points + 10

      if sum > 21
        1
      else
        10
      end
    elsif card.to_i.zero?
      10
    else
      card.to_i
    end
  end
end