require 'docking_station'

describe DockingStation do

  let(:bike) {double :bike}

  it 'returns a bike that is working' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    expect(bike).to be_working
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { double :bike }

    it 'has variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error "Docking station full"
    end

    it "raises an error using default capacity" do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "Docking station full"
    end

  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks working bikes" do
      expect(subject.dock(bike)).to eq [bike]
    end

    it "docks broken bikes" do
      allow(bike).to receive(:report_broken).and_return(true)
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#capacity' do
    it "specifies larger capacity when necessary" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:broken?)
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end

    it "releases working bikes" do
      allow(bike).to receive_messages(:broken? => false, :working? => true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "does not release broken bikes" do
      allow(bike).to receive_messages(:broken? => true, :report_broken => true)
      subject.dock bike
      expect{ subject.release_bike}.to raise_error "This bike is broken"
    end

    it 'raise error when no bikes are available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end



end
