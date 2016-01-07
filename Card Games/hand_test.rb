require_relative 'hand.rb'
require_relative 'card.rb'
require 'test/unit'

class HandTest < Test::Unit::TestCase
  def setup
    #Passing our given cards to test our first middle ground subclass, connects 'Liar'&'Idiot' to 'Hand'
    @TwoCardHand = TwoCard.new(Card.new(:Ace), Card.new(:Jack))
    @LiarHand = Liar.new(Card.new(:Ace), Card.new(:Jack))
    @IdiotHand = Idiot.new(Card.new(:King), Card.new(:Two))

    #Passing our given cards to test our second middle ground subclass, connects 'Light'&'Spider' to 'Hand'
    @FiveCardHand = FiveCard.new(Card.new(:King), Card.new(:Three), Card.new(:Five), Card.new(:Seven), Card.new(:Ten))
    @LightHand = Light.new(Card.new(:Ace), Card.new(:Three), Card.new(:Five), Card.new(:Queen), Card.new(:Ten))
    @SpiderHand = Spider.new(Card.new(:Two), Card.new(:King), Card.new(:Queen), Card.new(:Five), Card.new(:Ace))
  end

  #All our card hands should be full on initialization since we pass the cards as given arguments, these tests ensure that they are so
  #it also makes sure that the parameter from 'TwoCard' & 'FiveCard' (2 or 5) was passed correctly on invoking super()
  def test_initialize
    assert_equal(2, @TwoCardHand.max_hand, 'Expected max hand size: 2 for <TwoCardHand>')
    assert_equal(2, @TwoCardHand.cards_in_hand, 'Expected hand size: 2 on initialization')

    assert_equal(5, @FiveCardHand.max_hand, 'Expected max hand size: 5 for <FiveCardHand>')
    assert_equal(5, @FiveCardHand.cards_in_hand, 'Expected hand size: 5 on initialization')
  end

  #Same as above, 'complete?' should return true since hands are full on initialization
  def test_complete?
    assert(@LiarHand.complete? == true, 'Hand for <LiarHand> expected to be full but wasnt.')
    assert(@IdiotHand.complete? == true, 'Hand for <IdiotHand> expected to be full but wasnt.')

    assert(@LightHand.complete? == true, 'Hand for <LightHand> expected to be full but wasnt')
    assert(@SpiderHand.complete? == true, 'Hand for <SpiderHand> expected to be full but wasnt')
  end

  #No hands will contain this card. This is simply because testCard is a different card object to the other card objects that
  #were passed as parameters in test_setup.
  def test_contains?
    testCard = Card.new(:Jack)

    assert(@LiarHand.contains?(testCard) == true, 'Jack was expected to be in hand <LiarHand>')
    assert_not_equal(true, @IdiotHand.contains?(testCard), 'Jack was not expected to be in hand <IdiotHand>')

    assert(@LightHand.contains?(testCard) == false, 'Card Jack not expected to be in <LightHand>')
    assert_not_equal(true, @SpiderHand.contains?(testCard), 'Jack was not expected to be in hand <SpiderHand>')
  end

  #Tests the 'add_card' and 'remove_card' methods for each of the card hand types. First we remove a card, then we test
  #that it was indeed removed. Then we add it back it and check that it was successfully added.
  def test_add_card
    @LiarHand.remove_card(Card.new(:Ace))

    assert_equal(1, @LiarHand.cards_in_hand, 'remove_card method not working for <LiarHand>')
    assert_equal(false, @LiarHand.contains?(Card.new(:Ace)), 'Ace card deleted from <LiarHand>, is it still there')
    @LiarHand.add_card(:Ace)
    assert_equal(2, @LiarHand.cards_in_hand, 'add_card method not working for <LiarHand>')

    @IdiotHand.remove_card(Card.new(:Two))

    assert_equal(1, @IdiotHand.cards_in_hand, 'remove_card method not working for <LiarHand>')
    assert_equal(false, @IdiotHand.contains?(Card.new(:Two)), 'Ace card deleted from <LiarHand>, is it still there')
    @IdiotHand.add_card(:Two)
    assert_equal(2, @IdiotHand.cards_in_hand, 'add_card method not working for <LiarHand>')

    @LightHand.remove_card(Card.new(:Queen))

    assert_equal(4, @LightHand.cards_in_hand, 'remove_card method not working for <LiarHand>')
    assert_equal(false, @LightHand.contains?(Card.new(:Queen)), 'Ace card deleted from <LiarHand>, is it still there')
    @LightHand.add_card(:Queen)
    assert_equal(5, @LightHand.cards_in_hand, 'add_card method not working for <LiarHand>')

    @SpiderHand.remove_card(Card.new(:King))

    assert_equal(4, @SpiderHand.cards_in_hand, 'remove_card method not working for <LiarHand>')
    assert_equal(false, @SpiderHand.contains?(Card.new(:King)), 'Ace card deleted from <LiarHand>, is it still there')
    @SpiderHand.add_card(:King)
    assert_equal(5, @SpiderHand.cards_in_hand, 'add_card method not working for <LiarHand>')


  end

  #Will do a look-up in each hash map of the card hand types to make sure they were defined correctly
  def test_value
    testCard = Card.new(:Jack)

    assert_equal(3, @LiarHand.value(testCard), 'Jack card value returned incorrect for <LiarHand>')
    assert_equal(11, @IdiotHand.value(testCard), 'Jack card value returned incorrect for <IdiotHand>')

    assert_equal(5, @LightHand.value(testCard), 'Jack card value returned incorrect for <LightHand>')
    assert_equal(3, @SpiderHand.value(testCard), 'Jack card value returned incorrect for <SpiderHand>')
  end

  #Tests the evaluate methods of each class. Remembering that Spider has an overwritten version and should return the median card
  def test_evaluate
    assert_equal(8, @LiarHand.evaluate, 'Evaluate not working for <LiarHand>, check parameters/hashmap values')
    assert_equal(7.5, @IdiotHand.evaluate, 'Evaluate not working for <IdiotHand>, check parameters/hashmap values')

    assert_equal(6.5, @LightHand.evaluate, 'Evaluate not working for <LightHand>, check parameters/hashmap values')
    assert_equal(0, @SpiderHand.evaluate, 'Evaluate not working for <SpiderHand>, check parameters/hashmap values')
  end
end