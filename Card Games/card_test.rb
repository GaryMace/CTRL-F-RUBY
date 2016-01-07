require_relative 'card.rb'
require 'test/unit'

class CardTest < Test::Unit::TestCase
 def setup
   @myCard = Card.new(:Jack)    #Every cards rank is just a symbol so we can check it vs our card hand type hashmaps
 end

  def test_initialize
    assert(@myCard.rank == :Jack, 'Expected card rank to be Jack(Failed)')  #Simply checks our card made above
  end

  def test_to_s
    assert_equal('Card rank: Jack', "#{@myCard}", 'To string method failed')    #Test the to_string method
  end
end