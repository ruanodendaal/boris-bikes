class Van
attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def take_broken_bikes(stored_bikes)
    broken_bikes = stored_bikes.select {|x| x.broken? }
  end

end
