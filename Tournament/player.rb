class Player
  attr_reader :score
  include Comparable

  def initialize(name, results)
    @name = name
    @results = results
  end

  def score_string
    score_string = ""
    @results.each do |result|
      score_string += "#{result} "
    end
    score_string
  end

  def total_score
    total_score = 0
    @results.each do |result|
      total_score += result.to_i
    end
    total_score
  end

  def to_s
    "#{@name} #{score_string}TOTAL: #{total_score} points"
  end

  def <=> (other)
    other.total_score <=> total_score
  end
end

