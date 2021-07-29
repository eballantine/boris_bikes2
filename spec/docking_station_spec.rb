require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new("working")

  it 'allows the user to create a docking station with a default capacity' do
    expect(docking_station.capacity).to eq 20
  end

  it 'allows the maintainer to create stations of custom capacities' do
    station = DockingStation.new(42)
    expect(station.capacity).to eq 42
  end

  it 'raises an error if no bikes are available' do
    expect { docking_station.release_bike }.to raise_error "No bikes available"
  end

  it 'can tell you whether it has bikes' do
    expect(docking_station.has_bikes?).to eq false
  end

  it 'can release a bike' do
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'can release a working bike' do
    docking_station.dock(Bike.new)
    expect(docking_station.release_bike.condition).to eq (:working)
  end

  it 'refuses to release a broken bike' do
    junk_station = DockingStation.new
    junk_station.dock(Bike.new(:broken))

    expect { junk_station.release_bike }.to raise_error "No working bikes"
  end

  it 'can tell you if a bike is working' do
    working_bike = Bike.new
    expect(working_bike.working?).to eq true
  end
  
  it 'can dock a bike' do
    empty_station = DockingStation.new
    empty_station.dock(Bike.new)
    expect(empty_station).to respond_to(:dock)
    expect(empty_station.has_bikes?).to eq true
  end

  it 'raises an error if a bike can\'t be docked because docking station is full' do
    (docking_station.capacity - docking_station.bikes.size).times { docking_station.dock(bike) }
    expect { docking_station.dock(bike) }.to raise_error "Docking Station is full" 
  end

  it "can allow a user to dock a bike and report the bike's condition as 'broken'" do
    test_broken_station = DockingStation.new 
    test_broken_station.dock(bike, "broken")
    expect(test_broken_station.bikes.last.condition).to eq "broken"
  end

end