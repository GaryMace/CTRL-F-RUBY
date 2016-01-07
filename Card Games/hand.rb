require_relative 'card.rb'

#Getters set so the instance variables can be tested in card_test.rb
class Hand
  attr_reader :cards_in_hand
  attr_reader :max_hand

  #Ideal to pass a hand size to restrict size of card for the game, adds flexibility
  def initialize(hand_size)
    @cards_in_hand = 0
    @max_hand = hand_size
    @hand = Array.new           #This will be an array of cards
    @values = nil               #Will be overridden with hash maps later
  end

  #Add given card to end of '@hand' array provided it's not already full
  #If it is full dont add another card to the hand
  def add_card(card)
    if(complete? == false)
      @hand << card
      @cards_in_hand += 1
    else
      nil
    end
  end

  #returns true iff our game hand is full
  def complete?
    @cards_in_hand == @max_hand
  end

  #Return true iff the 'card' is contained in the current hand
  def contains?(card)
    0.upto(@cards_in_hand-1) do |i|
      if(@hand[i].rank == card.rank)
        return true
      end
    end
    return false
  end

  #Its very important that value(card) works for all the card hand types regardless of which is invoked. This method will work regardless of
  #which card hand type is defined
  def value(card)
    @values[card.rank]
  end

  #Since three of four card hand types use the same algorithm for evaluate we can just use it in our superclass and override it
  #late in the one class that requires a different version of it
  def evaluate
    min = @values[@hand[0].rank].to_f
    max = min

    1.upto(@max_hand-1) do |i|
      if(@values[@hand[i].rank] < min)
        min = @values[@hand[i].rank].to_f
      end
      if(@values[@hand[i].rank] > max)
        max = @values[@hand[i].rank].to_f
      end
    end

    (max + min) / 2                           #returns our value
  end

  #Removes given card if it finds it in the hand array. This method will be used for testing the 'add_card' method
  def remove_card(card)
    if(contains?(card))
      0.upto(@max_hand-1) do |i|
        if(@hand[i].rank == card.rank)
          @hand.delete(@hand[i])
          @cards_in_hand -= 1
          break
        end
      end
    else
      return nil
    end
  end
end

#All two card hand games take in two cards, invokes super of 'Hand' with 2 as @max_hand size, NB: add cards after since
#super() will set @cards_in_hand = 0 i.e. it will override its value
class TwoCard < Hand
  def initialize(card1, card2)
    super(2)
    add_card(card1)
    add_card(card2)
  end
end

#All five card hand games take in five cards, invokes super of 'Hand' with 5 as @max_hand size, NB: add cards after since
#super() will set @cards_in_hand = 0 i.e. it will override its value
class FiveCard < Hand
  def initialize(card1, card2, card3, card4, card5)
    super(5)
    add_card(card1)
    add_card(card2)
    add_card(card3)
    add_card(card4)
    add_card(card5)
  end
end

#We could have used the add_card method within all these classes as appose to using add_card in 'TwoCard' but that would be repeating identical
#code across two classes which is pointless
class Liar < TwoCard
  def initialize(card1, card2)
    super(card1, card2)                               #Invokes 'initialize' method in 'TwoCard'
    @values = Hash[
        :Ace, 13, :Two, 12, :Three, 11, :Four, 10, :Five, 9, :Six, 8,
        :Seven, 7, :Eight, 6, :Nine, 5, :Ten, 4, :Jack, 3, :Queen, 2, :King, 1
    ]
  end
end

#Invokes 'initialize' method in 'TwoCard' using super() since it's a subclass of that Class.
#Note that the @values instance variable from the super class is overwritten with a hash map in each hand type subclass
class Idiot < TwoCard
  def initialize(card1, card2)
    super(card1, card2)
    @values = Hash[
        :Ace, 1, :Two, 2, :Three, 3, :Four, 4, :Five, 5, :Six, 6,
        :Seven, 7, :Eight, 8, :Nine, 9, :Ten, 10, :Jack, 11, :Queen, 12, :King, 13
    ]
  end
end

#Invokes 'initialize' method in 'FiveCard' using super() since it's a subclass of that Class.
class Light < FiveCard
  def initialize(card1, card2, card3, card4, card5)
    super(card1, card2, card3, card4, card5)
      @values = Hash[
          :Ace, 1, :Eight, 2, :Five, 3, :Jack, 5, :King, 6, :Nine, 7,
          :Queen, 8, :Seven, 9, :Six, 10, :Ten, 11, :Three, 12, :Two, 13
      ]
  end
end

#Invokes 'initialize' method in 'FiveCard' using super() since it's a subclass of that Class.
class Spider < FiveCard
  def initialize(card1, card2, card3, card4, card5)
    super(card1, card2, card3, card4, card5)
    @values = Hash[
        :Ace, 0, :Two, 0, :Three, 0, :Four, 0, :Five, 0, :Six, 0,
        :Seven, 0, :Eight, 0, :Nine, 0, :Ten, 0, :Jack, 3, :Queen, 2, :King, 1
    ]
  end

  #Overriding method: Overrides evaluate method in 'Hand' for this card hand type only!!
  #Sorts the '@hand' array and returns the median value
  def evaluate
    0.upto(@max_hand-1) do |i|
      (i+1).upto(@max_hand-1) do |j|
        if(j < @max_hand)
          if(@values[@hand[j].rank] < @values[@hand[i].rank])
            temp = @hand[i]
            @hand[i] = @hand[j]
            @hand[j] = temp
          end
        end
      end
    end

    @values[@hand[@max_hand / 2].rank]
  end
end