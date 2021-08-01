require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if dock_empty?
    raise 'No working bikes' if @bikes.none? { |bike| bike.condition == :working }

    bike = @bikes.find { |b| b.condition == :working }
    @bikes.delete(bike)
  end

  def dock(bike)
    raise 'Docking Station is full' if @bikes.length >= @capacity

    @bikes << bike
  end

  def has_bikes?
    @bikes.!empty?
  end

  private

  def dock_full?
    @bikes.size >= @capacity
  end

  def dock_empty?
    @bikes.empty?
  end
end
