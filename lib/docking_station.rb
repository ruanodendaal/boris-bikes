require_relative 'bike'

class DockingStation

  def initialize
    @stored_bikes = []
  end

  attr_reader :stored_bikes

  def release_bike
    raise "No bikes available" if @stored_bikes.empty?
    @stored_bikes.pop
  end

  def dock_bike(stored_bikes)
    raise "Docking station full" if @stored_bikes.size >= 20
    @stored_bikes << stored_bikes
  end

end
