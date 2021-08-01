require "docking_station"

describe DockingStation do
  it 'allows the user to create a docking station with a default capacity' do
    expect(subject.capacity).to eq 20
  end

  it 'allows the maintainer to create stations of custom capacities' do
    station42 = DockingStation.new(42)
    expect(station42.capacity).to eq 42
  end

  it 'raises an error if no bikes are available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it 'can tell you whether it has bikes' do
    expect(subject.has_bikes?).to eq false
  end

  it 'can release a bike' do
    expect(subject).to respond_to(:release_bike)
  end

  it 'can release a working bike' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike.condition).to eq (:working)
  end

  it 'refuses to release a broken bike' do
    bike = double(:bike)
    subject.dock(bike)

    expect { subject.release_bike }.to raise_error "No working bikes"
  end

  it 'can tell you if a bike is working' do
    working_bike = double(:bike)
    expect(working_bike.working?).to eq true
  end
  
  it 'can dock a bike' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject).to respond_to(:dock)
    expect(subject.has_bikes?).to eq true
  end

  it 'raises an error if a bike can\'t be docked because docking station is full' do
    bike = double(:bike)
    docking_station = DockingStation.new
    (subject.capacity - docking_station.bikes.size).times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error "Docking Station is full" 
  end

  it "can allow a user to dock a bike and report the bike's condition as 'broken'" do
    bike = double(:bike)
    subject.dock(bike, "broken")
    expect(subject.bikes.last.condition).to eq "broken"
  end

end