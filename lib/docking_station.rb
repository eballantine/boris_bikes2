class DockingStation
  attr_reader :bikes

  def initialize
    @capacity = 20
    @bikes = []
  end
  
  def release_bike
    raise "No bikes available" if has_bikes? == false
    bike = @bikes.pop
  end
  
  def dock(bike)
    raise "Docking Station is full" if @bikes.length >= @capacity
    @bikes << bike
  end
  
  def has_bikes?
    @bikes.count > 0
  end
end
