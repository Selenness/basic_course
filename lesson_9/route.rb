class Route
  include Validation

  attr_reader :start_station, :last_station, :station
  attr_accessor :stations

  validate :start_station, :type, Station
  validate :last_station, :type, Station

  def initialize(start_station, last_station)
    @start_station = start_station
    @last_station = last_station
    validate!
    @stations = [start_station, last_station]
  end

  def add_station(station, number)
    if @stations.include?(station)
      puts 'Такая станция уже есть'
    else
      @stations.insert(number -1, station)
    end
  end

  def del_station(station)
    @stations.delete(station) if station != @stations.first || station != @stations.last
  end

  def show_route
    i = 0
    @stations.each { |station| puts "#{i += 1} - #{station}" }
  end

end