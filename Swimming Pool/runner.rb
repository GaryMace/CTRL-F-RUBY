require_relative 'terrain.rb'
require_relative 'swimming_pool.rb'

class Runner
  #Just change the parameter of Terrain.new to change the file to open
  def initialize
    myLand = Terrain.new('james.dat')
    myPool = SwimmingPool.new(myLand.data, myLand.arr_size)
  end
end

myRunner = Runner.new