
class Card
  attr_reader :rank

  def initialize(rank)  #Every cards rank is just a symbol so we can check it vs our card hand type hashmaps
    @rank = rank
  end

  def to_s
    "Card rank: #{@rank}"
  end
end