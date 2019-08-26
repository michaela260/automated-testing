require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do
    
    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end
    
    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end
  
  describe "Testing to_s" do
    
    it "to_s returns a readable String value logically for values 2-10" do
      # Test to ensure that to_s works for cards values 2-10
      # for example:  "2 of diamonds"
      
      value = 1
      9.times do
        value += 1
        suit = ["diamonds", "hearts", "spades", "clubs"].sample
        example_card = Card.new(value, suit)
        result = example_card.to_s
        expect(result).must_equal "#{value} of #{suit}"
      end
    end
    
    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      # The current implementation of to_s does not address this feature
      # Write the test, see it fail, then modify to_s to make it pass!
      # (Consider writing a helper method!)
      
      test_values = {
      1 => "Ace",
      11 => "Jack",
      12 => "Queen",
      13 => "King" }
      
      test_values.each do |number, character|
        suit = ["diamonds", "hearts", "spades", "clubs"].sample
        example_card = Card.new(number, suit)
        result = example_card.to_s
        expect(result).must_equal "#{character} of #{suit}"
      end
    end
  end
  
  
  
  describe "Reader methods" do
    
    it "Can retrieve the value of the card using a `.value`." do
      # ensure that `.value works as expected`
      special_cards = {
      1 => "Ace",
      11 => "Jack",
      12 => "Queen",
      13 => "King" }
      
      values = (1..13).to_a
      values.each do |value|
        suit = ["diamonds", "hearts", "spades", "clubs"].sample
        
        test_card = Card.new(value, suit)
        
        result = test_card.value
        
        if special_cards.keys.include? value
          real_value = special_cards[value]
        else
          real_value = value
        end
        
        expect(result).must_equal real_value  
      end
    end
    
    
    it "Can retrieve the value of the card using a `.suit`." do
      # ensure that `.suit works as expected returning the symbol of the suit`
      
      values = (1..13).to_a
      values.each do |value|
        suit = ["diamonds", "hearts", "spades", "clubs"].sample
        
        test_card = Card.new(value, suit)
        
        result = test_card.suit
        
        expect(result).must_equal suit.to_sym
      end
    end
  end
end
