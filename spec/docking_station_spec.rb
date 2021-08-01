require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  describe 'initialisation' do
    it 'allows the user to create a docking station with a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'allows the maintainer to create stations of custom capacities' do
      station42 = DockingStation.new(42)
      expect(station42.capacity).to eq 42
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock bike }
      expect{ docking_station.dock(bike)}.to raise_error 'Docking Station is full'
    end
  end

  describe '#release_bike' do
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do
      subject.dock(bike)
      allow(bike).to receive(:condition).and_return(:working)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error if no bikes are available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:condition).and_return(:working)
      test_bike = subject.release_bike
      expect(test_bike).to be_working
    end

    it 'doesn\'t release broken bikes' do
      bike = double(:bike, broken?: true, condition: :broken)
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'No working bikes'
    end
  end

  describe '#dock' do
    it 'responses to dock' do
      is_expected.to respond_to(:dock).with(1).argument
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'can dock a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error if a bike can\'t be docked because docking station is full' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock(bike) }.to raise_error 'Docking Station is full'
    end

    it 'can allow a user to dock a bike and report the bike\'s condition as broken' do
      bike = double(:bike, broken?: true, condition: :broken)
      subject.dock(bike)
      expect(subject.bikes.last.condition).to eq :broken
    end
  end

  it 'responds to bikes' do
    expect(subject).to respond_to :bikes
  end
end
