
module Gdp
  GDP = Hash[]
  IO.foreach("gdp.txt") do |line|
    partitions = line.split(' ')
    GDP[partitions[0]] = partitions[1].to_f
  end
end