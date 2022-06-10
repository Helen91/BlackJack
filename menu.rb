require "./pack.rb"
require "./point.rb"

include Point
game_pack = Pack.new

while true
  
  diler_cards = []

  balans = 100

  puts "Игра началась"
  # puts "Напишите свое имя"
  # name = gets.chomp

  # puts "Сделайте ставку #{name}. У вас в банке 100 монет"
  # bet = gets.chomp.to_i
  # plaer_balans = balans - bet
  # puts "#{name} cтавка на сумму #{bet} принята, в банке осталось #{plaer_balans}"

  player_cards = [game_pack.give_cart, game_pack.give_cart]
  puts player_cards
  points = games_point(player_cards)

  puts "Cумма ваших очков = #{points}"
  puts "Напишите 1 что бы взять еще карту, 2 что-бы пропустить"
  num = gets.chomp.to_i
  while num == 1
    player_cards << game_pack.give_cart
    puts player_cards
    points = games_point(player_cards)
    puts "Cумма ваших очков #{points}"
    if points > 21
      puts "Вы проиграли"
      num = 0
    else
      puts "Напишите 1 что бы взять еще карту, 2 что-бы пропустить"
      num = gets.chomp.to_i
    end
  end
end
