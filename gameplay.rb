# 2 each |♣| (4 раза)
# 4 balance
# 5 if_else (4 раза )

require "./pack.rb"
require "./point.rb"
require "./player.rb"

game_pack = Pack.new
player = Player.new(100)
diler = Player.new(100)

loop do
#5 if_else
 if player.balance <= 0
  puts "end"
  break
 end

  #break(puts "игра закончена") if plaer_balance <= 0
  puts "Игра началась"

  # puts "Напишите свое имя"
  # name = gets.chomp
   bet = 10
   #4balance
   player.balance -= bet
   puts "Cтавка на сумму #{bet} принята, у вас осталось #{player.balance}"
   #bank = [bet]

  2.times { player.add_card(game_pack.give_cart) }
  #2each
  player.cards.each { |c| print "|" + c + "|"}

  puts "\nCумма ваших очков = #{player.points}"

  puts "Дилер взял 2 карты |*||*|"
  2.times { diler.add_card(game_pack.give_cart) }

  puts "Напишите 1 что бы взять еще карту, 2 что-бы продолжить игру"

  num = gets.chomp.to_i

  while num == 1
    player.add_card(game_pack.give_cart)
    #2each
    player.cards.each { |c| print "|" + c + "|"}
    puts "\nCумма ваших очков #{player.points}"
    #5if_else
    if player.lose?
      num = 0
    else
      puts "Напишите 1 что бы взять еще карту, 2 что-бы продолжить игру"
      num = gets.chomp.to_i
    end
  end

  #5if_else
  if player.lose?
    puts "Вы проиграли"
    p "-" * 20
    next
  end
   p "-" * 20
   puts "Игра перешла к дилерру"

   #2each
   diler.cards.each{ |c| print "|" + c + "|"}
   puts "\nCумма очков дилера #{diler.points}"

  while diler.points <= 16
    puts "Сумма очков дилера > #{diler.points}. Он берет еще кaрту"
    diler.add_card(game_pack.give_cart)
    #2each
    diler.cards.each{ |c| print "|" + c + "|"}
  end

  #5if_else
  if diler.lose?
    puts "Дилер проиграл. Cумма его очков:#{diler.points}"
    #balance
    player.balance += 20

  p "-" * 20
  elsif diler.points < player.points
    puts "Ура вы выйграли! ДИЛЕР проиграл!  Очки дилера:#{diler.points}. Очки игрока:#{player.points}"
    #balance
    player.balance += 20

  elsif diler.points > player.points
    puts "Дилер выйграл! Очки дилера:#{diler.points}.  Очки игрок:#{player.points}"

  elsif diler.points == player.points
    puts "Ничья"
    #balance
    player.balance += 10
  end

  p "-" * 20
end