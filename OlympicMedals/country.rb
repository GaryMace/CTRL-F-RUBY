require_relative 'gdp.rb'

class Country
  include Gdp
  attr_reader :golds, :silvers, :bronzes, :name, :population, :score

  def initialize(line_from_file)
    partitions = line_from_file.split(' ')
    if(partitions.length != 5)
      abort("Invalid country details: File may not contain enough information")
    end

    @name = partitions[0]
    @golds = partitions[1].to_i
    @silvers = partitions[2].to_i
    @bronzes = partitions[3].to_i
    @population = partitions[4].to_i
  end

  def to_s
    "#{@name}, #{@golds}, #{@silvers}, #{@bronzes}, #{@population}"
  end

  def score
    @score = ((@golds*3 + @silvers*2 + @bronzes) / Gdp::GDP[@name]).to_f
  end
end