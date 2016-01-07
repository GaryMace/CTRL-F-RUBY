require 'test/unit'
require_relative 'tournament.rb'

class TournamentTest < Test::Unit::TestCase
  def setup
    @my_tournament = Tournament.new("tournament.txt")
  end

  def test_print
    assert_equal(
        "Eimear 1 1 1 0 1 TOTAL: 4 points\n"\
         "Jack 0 0 0 0 1 TOTAL: 1 points\n"\
         "Ciara 1 0 1 1 0 TOTAL: 3 points\n"\
         "Jamie 0 1 0 0 1 TOTAL: 2 points\n"\
         "Luke 1 0 0 1 0 TOTAL: 2 points\n"\
         "Aoife 0 1 1 1 0 TOTAL: 3 points", "#{@my_tournament.print}", 'print method not working for <Tournament>')
  end

  def test_sort_players
    @my_tournament.sort_players
    assert_equal(
        "Eimear 1 1 1 0 1 TOTAL: 4 points\n"\
         "Ciara 1 0 1 1 0 TOTAL: 3 points\n"\
         "Aoife 0 1 1 1 0 TOTAL: 3 points\n"\
         "Jamie 0 1 0 0 1 TOTAL: 2 points\n"\
         "Luke 1 0 0 1 0 TOTAL: 2 points\n"\
         "Jack 0 0 0 0 1 TOTAL: 1 points", "#{@my_tournament.print}", 'print method not working for <Tournament>')
  end
end