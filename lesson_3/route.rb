class Route
  attr_reader :start_station, :last_station

  def initialize(start_station, last_station)
    @route = [start_station, last_station]
  end

  def add_middle_station(station, number)
    number = 1
    if @route.include?(station)
      puts "Такая станция уже есть"
    else
      @route.insert(number + 1, station)
    end
  end

  def delete_middle_station(station)
    @route.delete(station) if station != @route.first || station != @route.last
  end

  def show_route
    i = 0
    @route.each { |station| puts "#{i + 1} - #{station}" }
  end

end