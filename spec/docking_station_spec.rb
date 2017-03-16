require 'docking_station'

describe DockingStation do

  it 'returns a bike that is working' do
   bike = Bike.new
   subject.dock(bike)
   expect(bike).to be_working
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it "raises an error when docking station is at full capacity" do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(Bike.new) }
      expect { docking_station.dock(Bike.new) }.to raise_error "Docking station full"
    end

    it "raises an error using default capacity" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
    end
  end

  describe '#capacity' do
    it "specifies larger capacity when necessary" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
  end

    it "releases working bikes" do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end

    it 'raise error when no bikes are available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end



end
