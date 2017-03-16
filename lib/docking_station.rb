require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    stored_bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station full" if full?
    stored_bikes << bike
  end

  private

  def full?
    stored_bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    stored_bikes.empty?
  end

end
