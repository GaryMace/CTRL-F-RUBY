require 'test/unit'
require_relative 'player.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @gary = Player.new("Gary", [1, 1, 1, 0, 0])
  end

  def test_to_s
    assert_equal("Gary 1 1 1 0 0 TOTAL: 3 points", "#{@gary}", 'To_s not working for <Player>')
  end
end