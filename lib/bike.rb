class Bike
  def initialize(condition)
    @condition = condition
  end
  def working?
    @condition == "working"
  end
end