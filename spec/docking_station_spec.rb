require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new("working")

  it 'raises an error if no bikes are available' do
    expect { docking_station.release_bike }.to raise_error "No bikes available"
  end

  it 'can tell you whether it has bikes' do
    expect(docking_station.has_bikes?).to eq false
  end

  it 'can release a bike' do
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'can tell you if a bike is working' do
    expect(bike.working?).to eq true
  end
  
  it 'can dock a bike' do
    expect(docking_station).to respond_to(:dock)
    docking_station.dock(bike)
    expect(docking_station).to have_attributes(:bikes => [bike])
    expect(docking_station.has_bikes?).to eq true
  end

  it 'raises an error if a bike can\'t be docked because docking station is full' do
    expect { docking_station.dock(bike) }.to raise_error "Docking Station is full"
  end

end