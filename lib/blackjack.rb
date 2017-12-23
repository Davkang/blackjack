require_relative "card"
require_relative "deck"
require_relative "hand"

player = Hand.new
computer = Hand.new
# Your code here...
deck = Deck.new

puts "Welcome to Blackjack!"

def player_turn(deck, player)
  player.add_card(deck.cards[-1])
  puts "Player was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
  player.add_card(deck.cards[-2])
  puts "Player was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
  deck.deal(2)
  display_score(player, 1)
  choice = 0
  score = player.calculate_hand
  while true
    choice = hit_stand
    if choice == "h"
      player.add_card(deck.cards[-1])
      puts "Player was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
      deck.deal(1)
      display_score(player, 1)
      score = player.calculate_hand
    elsif choice == "s"
      display_score(player, 1)
      # return score
      break
    else
      puts "Wrong input"
    end

    if score == "Bust!"
      #puts "bust, player loses"
      break
    end
  end
end

def display_score(player, turn)
  if turn == 1
    puts "Player score: #{player.calculate_hand}"
  else
    puts "Dealer score: #{player.calculate_hand}"
  end
end

def hit_stand
  print "Hit or stand (H/S): "
  input = gets.chomp.downcase
  if input == "h" || input == "s"
    return input
  else
    return 0
  end
end

def dealer_turn(deck, player)
  puts "\n Dealer's turn\n"
  player.add_card(deck.cards[-1])
  puts "Dealer was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
  player.add_card(deck.cards[-2])
  puts "Dealer was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
  deck.deal(2)
  score = player.calculate_hand
  display_score(player, 2)
  while true
    player.add_card(deck.cards[-1])
    puts "Dealer was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
    deck.deal(1)
    display_score(player, 2)
    score = player.calculate_hand

    if score == "Bust!"
      break
    elsif score > 17
      display_score(player, 2)
      #return score
      break
    end
  end
end




# def winner?
#
# end

#player_score =
player_turn(deck, player)
#dealer_score =
dealer_turn(deck, computer)

#if player_score > dealer_score
#  puts "player wins!"
