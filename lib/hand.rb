require_relative 'deck'

class Hand
  # Your code here
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(new_card)
    @cards << new_card
  end

  def calculate_hand
    # count_arry = []
    total = 0
    ace_count = 0

    # take each card and get its value into an array
    @cards.each_with_index.map do |card, index|
      current_card = card.rank
      if current_card == 'J' || current_card == 'Q' || current_card == 'K'
        total += 10
      elsif current_card == 'A'
        total += 11
        ace_count += 1
      else
        total += current_card
      end

      if total > 21
        @cards.each_with_index.map do |card, index|
          if card.rank == 'A' && ace_count != 0
            total -= 10
            ace_count -= 1
            break
          end
        end
        if total > 21
          return "Bust!"
        end
      end
    end
    return total
  end
end

# require 'pry'
# binding.pry
