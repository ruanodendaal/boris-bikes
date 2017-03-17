require 'van'

describe Van do

  it 'should collect a broken bike' do
    bike = Bike.new
    bike.report_broken
    station = (DockingStation.new).dock(bike)
    expect(subject.take_broken_bikes(station)).to eq [bike]
  end

  it 'should collect all broken bikes' do
    bike1 = Bike.new
    bike1.report_broken
    bike2 = Bike.new
    bike2.report_broken
    bike3 = Bike.new
    station = (DockingStation.new)
    station.dock(bike1)
    station.dock(bike2)
    array = station.dock(bike3)

    expect(subject.take_broken_bikes(array)).to eq [bike1, bike2]
  end


end
