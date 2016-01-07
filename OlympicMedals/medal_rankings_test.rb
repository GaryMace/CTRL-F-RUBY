require 'test/unit'
require_relative 'country.rb'
require_relative 'medal_rankings.rb'

class MedalRankingsTest < Test::Unit::TestCase
  def setup
    @my_medal_rankings = MedalRankings.new
    @my_medal_rankings.read_file("medals.txt")
  end

  def test_average_pop
    assert_equal(33778365, @my_medal_rankings.average_pop, 'Average_population method in <MedalRankings> not working')
  end

  def test_most_golds
    assert_equal("USA, 46, 29, 29, 309349000", @my_medal_rankings.most_golds.to_s, 'Most_golds method in <MedalRankings> not working')
  end

  def test_to_s
    assert_equal(
        "AFG, 0, 0, 1, 34385000 \nALB, 0, 0, 0, 3205000 \nDZA, 1, 0, 0, 35468000 \nASM, 0, 0, 0, 68420 \n",
        @my_medal_rankings.to_s(4), 'Method to_s(n) not working for <MedalRankings>'
    )
  end

  def test_sort!
    @my_medal_rankings.sort!
    assert_equal(
        "GRD, 1, 0, 0, 104000 \nJAM, 4, 4, 4, 2702000 \nPRK, 4, 0, 2, 24589122 \nGEO, 1, 3, 3, 4452000 \nMNG, 0, 2, 3, 2756000 \n",
        @my_medal_rankings.to_s(5), 'Method to_s(n) not working for <MedalRankings> after sort')
  end
  def test_each_single_gold_winner
    array = []
    str = ""
    @my_medal_rankings.each_single_gold_winner {|country| array << country}
    array.sort_by!{|country| country.name}
    array.each{|country| str += "#{country}"}

    assert_equal(
        "BHS, 1, 0, 0, 343000DZA, 1, 0, 0, 35468000GRD, 1, 0, 0, 104000UGA, 1, 0, 0, 33424000VEN, 1, 0, 0, 28834000",
        str, 'each_single_gold_winner method in <MedalRankings> not working.'
    );
  end
end