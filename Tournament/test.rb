module Test
  def self.test(file_name)
    @data = Array.new{Array.new}
    @names = []
    open_file(file_name)
    wins_and_losses
    num_rounds
    check_round_data
  end

  def self.open_file(file_name)
    IO.foreach(file_name) do |line|
      partitions = line.split(' ')
      player_name = partitions[0]
      player_score = partitions.slice(1, partitions.size).map {|score| score.to_i}
      @data << player_score
      @names << player_name
    end
  end

  def self.wins_and_losses
    wins, loses = 0, 0

    (@data.size).times do |i|
      (@data[i].size).times do |j|
        if(@data[i][j] == 1)
          wins += 1
        elsif(@data[i][j] == 0)
          loses += 1
        end
      end
    end

    if(wins != loses)
      return 'File not consistent: Num wins not equal num loses'
    end
  end

  def self.num_rounds
    (@data.size).times do |i|
      if((@data[i].size-1) != @names.size)
        return 'File not consistent: Either too many or not enough rounds'
      end
    end
  end

  def self.check_round_data
    (@data.size).times do |i|
      (@data[i].size).times do |j|
        if(@data[i][j] > 1 || @data[i][j] < 0)
          return 'File corrupt'
        end
      end
    end
    return 'File is consistent'
  end
end