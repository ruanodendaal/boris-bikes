require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'returns a bike that is working' do
   bike = subject.release_bike
   expect(bike).to be_working
  end

end
