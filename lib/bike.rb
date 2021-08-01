# All bikes assumed to be Boris Bikes
class Bike
  attr_accessor :condition

  def initialize(condition = :working)
    @condition = condition
  end

  def working?
    @condition == :working
  end

  def broken?
    @condition == :broken
  end

  def report_broken
    @condition = :broken
  end
end
