
# card.rb

class Card
  attr_reader :value, :suit
  VALID_SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALID_VALUES = {
  1 => "Ace",
  2 => 2,
  3 => 3,
  4 => 4,
  5 => 5,
  6 => 6,
  7 => 7,
  8 => 8,
  9 => 9,
  10 => 10,
  11 => "Jack",
  12 => "Queen",
  13 => "King"
}

def initialize(value, suit)
  
  if !VALID_VALUES.keys.include? value
    raise ArgumentError.new "Error! The given value, #{value}, is not a valid card value."
  elsif !VALID_SUITS.include? suit.to_sym
    raise ArgumentError.new "Error! The given suit, #{suit}, is not a valid card suit."
  end
  
  @value = VALID_VALUES[value]
  @suit = suit.to_sym
  
end

def to_s
  return "#{value} of #{suit.to_s}"
end

end
