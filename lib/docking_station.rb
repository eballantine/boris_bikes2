class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end
  
  def release_bike
    raise "No bikes available" if has_bikes? == false
    bike = Bike.new("working")
  end
  
  def dock(bike)
    raise "Docking Station is full" if has_bikes? == true
    @bikes << bike
  end
  
  def has_bikes?
    @bikes.count > 0
  end
end
