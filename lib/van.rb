class Van
attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def take_broken_bikes(stored_bikes)
    broken_bikes = stored_bikes.select {|x| x.broken? }
    # still need to inform docking_station to remove the broken bikes
    stored_bikes = stored_bikes - broken_bikes
    return broken_bikes
  end

end
