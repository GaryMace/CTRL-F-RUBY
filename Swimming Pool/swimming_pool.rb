class SwimmingPool

  def initialize(plot, plot_size)
    @data = plot
    @arr_size = plot_size
    @pool_elev = @data[@arr_size-1][@arr_size-1].to_i
    @lowest_x = @arr_size-1
    @lowest_y = @arr_size-1
    @count_matrix = Array.new(@arr_size){Array.new(@arr_size)}

    find_max_sizes
    print_pool_coords
  end

  #Checks to the right of and below curr arr index for the same elev num. If they are the same then there could be  a
  #square of array indexs of the same elevation
  def find_max_sizes
    (@arr_size-1).downto(0) do |i|
      (@arr_size-1).downto(0) do |j|
        elev = @data[i][j].to_i
        if(i == (@arr_size - 1) || j == (@arr_size - 1))
          @count_matrix[i][j] = 1
          next
        end

        #If one step to the right or one step down is out of bounds then don't do the next part
        if(j+1 >= @arr_size || i+1 >= @arr_size)
          next
        end
        if(@data[i][j+1].to_i == elev && @data[i+1][j].to_i == elev)
          count = get_min_count(i, j, elev)
          @count_matrix[i][j] = count
          #Is there a new best location for the pool elevation wise?
          if(elev <= @pool_elev && @count_matrix[i][j] > @count_matrix[@lowest_x][@lowest_y])
            @lowest_x = i
            @lowest_y = j
            @pool_elev = elev
          end
        else
          @count_matrix[i][j] = 1
        end
      end
    end

    ##for i in 0..@arr_size-1       prints array elev with count beside it
    #  for j in 0..@arr_size-1
    #    print "#{@data[i][j].to_i}(#{@count_matrix[i][j]}) "
    #  end
    #  puts"\n"
    #end

  end

  #This algorithm gets the smallest adjacent count either below or to the right of the current array index and adds one
  #It will then assign that as the current index count, i.e the size of the square of terrain
  def get_min_count(i, j, elev)
    if(@count_matrix[i][j+1].to_i > @count_matrix[i+1][j].to_i)
      new_count = @count_matrix[i+1][j] + 1
      if(@data[i+(new_count-1)][j+(new_count-1)].to_i != @data[i][j].to_i)
        new_count = 1
      end
      new_count
    else
      new_count = @count_matrix[i][j+1] + 1
      if(@data[i+(new_count-1)][j+(new_count-1)].to_i != @data[i][j].to_i)
        new_count = 1
      end
      new_count
    end
  end

  def print_pool_coords
    puts "SWIMMING POOL\n The best site is (#{@lowest_y}, #{@lowest_x}) where there's a #{@count_matrix[@lowest_x][@lowest_y]}" \
          "x#{@count_matrix[@lowest_x][@lowest_y]} pool of height #{@pool_elev}"
  end
end
