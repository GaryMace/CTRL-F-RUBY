require_relative 'player.rb'

class Tournament

  def initialize(file_name)
    @players = []
    open_file(file_name)
  end

  def open_file(file_name)
    IO.foreach(file_name) do |line|
      partitions = line.split(' ')
      player_name = partitions[0]
      player_score = partitions.slice(1, partitions.size)
      @players << Player.new(player_name, player_score)
    end
  end

  def print
    str = ""
    @players.each do |player|
      str += "#{player}\n"
    end
    str.chomp
  end

  def sort_players
    @players.sort!
  end
end