class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @bikes = []
  end
  
  def release_bike
    raise "No bikes available" if dock_empty?
    bike = @bikes.pop
  end
  
  def dock(bike, condition = "working")
    raise "Docking Station is full" if @bikes.length >= @capacity
    bike.update_bike_condition(condition)
    @bikes << bike
  end
  
  def has_bikes?
    (1..@capacity).cover? (@bikes.size)
  end

  private

  def dock_full?
    @bikes.size >= @capacity
  end

  def dock_empty?
    @bikes.size <= 0
  end

end

