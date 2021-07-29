require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  bike1 = Bike.new("working")

  it 'raises an error if no bikes are available' do
    expect { docking_station.release_bike }.to raise_error "No bikes available"
  end

  it 'checks docking station is functional' do
    expect(docking_station.has_bikes?).to eq false
    expect(docking_station).to respond_to(:release_bike)
    expect(bike1.working?).to eq true
    expect(docking_station).to respond_to(:dock)
  end
  
  it 'checks docking a bike works' do
    docking_station.dock(bike1)
    expect(docking_station).to have_attributes(:bikes => [bike1])
    expect(docking_station.has_bikes?).to eq true
  end

end