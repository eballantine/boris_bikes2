require "bike"

describe Bike do
  it { expect(Bike.new("working")).to respond_to(:working?) }
end