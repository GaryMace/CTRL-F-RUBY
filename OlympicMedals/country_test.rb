require 'test/unit'
require_relative 'country.rb'

class CountryTest < Test::Unit::TestCase
  def setup
    @brazil = Country.new("BRA 3 5 9 194946000")
    @australia = Country.new("AUS 7 16 12 22299000")
    @belgium = Country.new("BEL 0 1 2 10896000")
  end

  def test_to_s
    assert_equal("BRA, 3, 5, 9, 194946000", "#{@brazil}", 'String returned from country <brazil> incorrect')
    assert_equal("AUS, 7, 16, 12, 22299000", "#{@australia}", 'String returned from country <argentina> incorrect')
    assert_equal("BEL, 0, 1, 2, 10896000", "#{@belgium}", 'String returned from country <belgium> incorrect')
  end

  def test_score
    assert_equal(1.130559425029778e-11,@brazil.score, 'Score for Brazil in <Country> class incorrect')
    assert_equal(4.7384382107657316e-11, @australia.score, 'Score for Australia in <Country> class incorrect')
    assert_equal(7.819632359984595e-12, @belgium.score, 'Score for Belgium in <Country> class incorrect')
  end
end