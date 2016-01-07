require_relative 'country.rb'
require_relative 'medal_rankings.rb'

medal_rankings = MedalRankings.new
medal_rankings.read_file("medals.txt")

puts "Part 2:\n"
puts"Average population: #{medal_rankings.average_pop}\n"
puts "Most golds: #{medal_rankings.most_golds}\n\n"

puts "Part 3: Top ten countries based on score\n"
medal_rankings.sort!
puts "#{medal_rankings.to_s(10)}"

puts "\nPart 4: Countries with 1 gold only:\n"
array = []

medal_rankings.each_single_gold_winner {|country| array << country}
array.sort_by!{|country| country.name}
array.each{|country| puts country}