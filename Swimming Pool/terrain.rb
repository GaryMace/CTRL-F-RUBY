class Terrain
attr_reader :data
attr_reader :arr_size

  def initialize(file_name)
    open_file(file_name)
    get_lowest_point
    mean_height
    deviation
  end

  #Iterates through the file and puts each datum into an array slot
  def open_file(file_name)
   i = 0

      IO.foreach(file_name) do |line|
        if (i==0)
          puts "Success, file opened!\n "
          @arr_size = line.to_i
          @data = Array.new(@arr_size) { Array.new(@arr_size)}  #Two-d array
        else
          0.upto(@arr_size){ |j| @data[i-1][j] = line.split[j] }
        end
        i+=1
      end
  end

  #Iterates through data and gets the lowest elevation's co-ordinates
  #This does however only return the co-ordinates of the first lowest point it finds, i.e. the first zero it finds
  def get_lowest_point
    min_point = @data[0][0].to_i
    x_coord = 0
    y_coord = 0

    0.upto(@arr_size-1) do |i|
      0.upto(@arr_size-1) do |j|
        if (@data[i][j].to_i < min_point)
          min_point = @data[i][j].to_i
          x_coord = i
          y_coord = j
        end
      end
    end

    puts "LOWEST POINT\n #{@data[x_coord][y_coord]}. Occurs at (#{x_coord} , #{y_coord})\n "
  end

  #Uses float in order to make the mean a more accurate value
  def mean_height
    @mean = 0

    0.upto(@arr_size-1) do |i|
      0.upto(@arr_size-1) do |j|
        @mean += @data[i][j].to_f
      end
    end

    @mean = @mean / (@arr_size * @arr_size)
    puts "MEAN HEIGHT\n #{@mean}\n "
  end

  #Gets deviation of elevations within the terrain
  def deviation
    s_deviation = 0

    0.upto(@arr_size-1) do |i|
      0.upto(@arr_size-1) do |j|
        temp = (@data[i][j].to_f - @mean)
        s_deviation += temp * temp
      end
    end

    s_deviation = Math.sqrt(s_deviation / (@arr_size * @arr_size))
    puts "STANDARD DEVIATION\n  #{s_deviation}\n "
  end
end
