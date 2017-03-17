require 'van'

describe Van do

  it 'should collect a broken bike' do
    bike = Bike.new
    bike.report_broken
    station = (DockingStation.new).dock(bike)
    expect(subject.take_broken_bikes(station)).to eq station
  end

  # it 'should collect all broken bikes' do
  #   bike = Bike.new
  #   bike.report_broken
  #   bike2 = Bike.new
  #   bike.report_broken
  #   bike3 = Bike.new
  #   station = (DockingStation.new).dock(bike)
  #   expect(subject.take_broken_bikes(station)).to eq station
  # end


end
