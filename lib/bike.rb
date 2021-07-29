class Bike
  attr_accessor :condition

  def initialize(condition = :working)
    @condition = condition
  end
  
  def working?
    @condition == :working
  end

  def update_bike_condition(condition)
    @condition = condition
  end
end