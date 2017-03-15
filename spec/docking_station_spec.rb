require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end


  it 'returns a bike that is working' do
   bike = Bike.new
   subject.dock_bike(bike)
   expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end

  # raise error when no bikes are available
  #expect {subject.release_bike}.to raise_error("No bikes available")

end
