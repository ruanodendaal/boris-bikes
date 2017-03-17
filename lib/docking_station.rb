require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @stored_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    raise "This bike is broken" if stored_bikes[-1].broken?
    stored_bikes.pop
  end

  def dock(bike)
    raise "Docking station full" if full?
    stored_bikes << bike
  end


private

  attr_reader :stored_bikes

  def full?
    stored_bikes.size >= capacity
  end

  def empty?
    stored_bikes.empty?
  end

end
