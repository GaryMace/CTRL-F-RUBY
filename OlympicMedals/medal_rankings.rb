require_relative 'country.rb'

class MedalRankings
  def initialize
    @countries = Array.new
  end

  def read_file(file_name)
    if(!File.exist?(file_name))
      abort("Error opening file: <File does not exist>")
    end
    i = 0
    IO.foreach(file_name) do |line|
      @countries << Country.new(line)
      i += 1
    end
  end

  #Every country this method finds with more golds will be placed in the curr_country_with_most_golds variable
  def most_golds
    if(!@countries.empty?)
      curr_country_with_most_golds = @countries[0]
      @countries.each do |country|
        if(country.golds > curr_country_with_most_golds.golds)
          curr_country_with_most_golds = country
        end
      end
    else
      curr_country_with_most_golds = nil
    end

    curr_country_with_most_golds
  end

  #I feel like an average population should be an integer so i'm returning an integer average
  def average_pop
    sum_of_populations = 0
    num_countries = 0

    if(!@countries.empty?)
      @countries.each do |country|
        sum_of_populations += country.population
        num_countries+= 1
      end
      sum_of_populations / num_countries
    else
      nil
    end
  end

  #Sorts each country by score then reverses it as originally it is in the wrong order
  def sort!
    @countries.sort_by! {|country| country.score}.reverse!
  end

  #Returns a string with all countries up to n in it
  def to_s(n)
    string_of_countries_upto_n = ""
    n.times do |i|
      string_of_countries_upto_n += "#{@countries[i]} \n"
    end

    string_of_countries_upto_n
  end

  #Yields each country in @countries to the block of code passed to this iterator IFF
  #the country has only 1 gold medal . i.e add it to the output array
  def each_single_gold_winner
    @countries.each do |country|
      if(country.golds == 1 && country.silvers == 0 && country.bronzes == 0)
        yield(country)
      end
    end
  end
end