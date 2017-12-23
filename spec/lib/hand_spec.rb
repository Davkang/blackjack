require "spec_helper"

RSpec.describe Hand do
  # Your tests here
  # '♦', '♣', '♠', '♥'

  # cards_1 = [Card.new("♦",10), Card.new("♥","J")]

  let(:hand) {Hand.new()}
  let(:ace_hand) {Hand.new()}
  let(:jack) {Card.new("J", "♦")}
  let(:eight) {Card.new(8, "♥")}
  let(:six) {Card.new(6, "♦")}
  let(:ten) {Card.new(10, "♥")}
  let(:ace) {Card.new("A", "♦")}

  #puts ace
  # let(:ace_hand) { Hand.new([Card.new("♦",10), Card.new("♥","A")]) }
  # let(:hand) { Hand.new([Card.new("♦",10), Card.new("♥","J")]) }
  # let(:regular_hand) { Hand.new([Card.new('♦', 6), Card.new("♥", 8)])}

  describe "#calculate_hand" do
    context "two ace cards" do
      it "expects two aces to equal 12" do
        hand.add_card(Card.new("A", "♦"))
        hand.add_card(Card.new("A", "♦"))
        expect(hand.calculate_hand).to eq(12)
      end
    end
    context "ace and 10 card" do
      it "expects blackjack value of 21" do
        ace_hand.add_card(Card.new("A", "♦"))
        ace_hand.add_card(Card.new(10, "♦"))
        expect(ace_hand.calculate_hand).to eq(21)
      end
    end
    context "face card and 10 card" do
      it "expects value of 20" do
        hand = Hand.new()
        hand.add_card(Card.new(10, "♦"))
        hand.add_card(Card.new("J", "♦"))
        expect(hand.calculate_hand).to eq(20)
      end
    end
    context "two regular cards" do
      it "expects a value of two regular cards to be 14" do
        hand = Hand.new()
        hand.add_card(Card.new(8, "♥"))
        hand.add_card(Card.new(6, "♦"))
        expect(hand.calculate_hand).to eq(14)
      end
    end

    context "greater than 21" do
      it "expects a greater value than 21" do
        hand = Hand.new()
        hand.add_card(Card.new(8, "♥"))
        hand.add_card(Card.new(6, "♦"))
        hand.add_card(Card.new(10, "♥"))
        expect(hand.calculate_hand).to eq("Bust!")
      end
    end
  end
end
