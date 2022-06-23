require './pack'
require './point'
require './player'

puts 'Напишите свое имя'
name = gets.chomp

game_pack = Pack.new
player = Player.new(100, name)
diler = Player.new(100)

loop do
  player.start_game
  diler.start_game

  if player.balance <= 0
    puts 'Игра окончена'
    break
  end
  puts '-' * 70
  puts 'Игра началась'

  bet = 10
  player.balance -= bet
  puts "Cтавка на сумму #{bet}$ принята, у вас осталось #{player.balance}$."

  2.times { player.add_card(game_pack.give_cart) }
  puts player.cards
  puts "Cумма ваших очков = #{player.points}."

  2.times { diler.add_card(game_pack.give_cart) }
  puts "#{diler.name} взял 2 карты |*||*|"

  puts 'Напишите 1 что бы взять еще карту, 2 что-бы продолжить игру'
  num = gets.chomp.to_i
  while num == 1
    player.add_card(game_pack.give_cart)

    puts player.cards
    puts "Cумма ваших очков #{player.points}"

    if player.lose?
      num = 0
    else
      puts 'Напишите 1 что бы взять еще карту, 2 что-бы продолжить игру'
      num = gets.chomp.to_i
    end
  end

  if player.lose?
    puts "Игрок #{player.name} проиграл"
    next
  end

  puts "Игра перешла к #{diler.name}"
  puts diler.cards

  while diler.points <= 16
    puts "Сумма очков #{diler.name} = #{diler.points}. Он берет еще кaрту"
    diler.add_card(game_pack.give_cart)
    puts diler.cards
  end

  if diler.lose?
    puts "#{diler.name} проиграл. Cумма его очков:#{diler.points}"
    player.balance += 20

  elsif diler.points < player.points
    puts "Ура #{player.new} выйграли! #{diler.name} проиграл! Очки #{diler.name}:#{diler.points} --- очки #{player.name}:#{player.points}"
    player.balance += 20

  elsif diler.points > player.points
    puts "#{diler.name} выйграл! Его очки:#{diler.points} --- очки #{player.name}:#{player.points}"

  elsif diler.points == player.points
    puts 'Ничья'
    player.balance += 10
  end
end
