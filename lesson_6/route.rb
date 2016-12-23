class Route
  attr_reader :start_station, :last_station, :station
  attr_accessor :stations

  STATION_FORMAT = /[А-Я][а-я]+/

  def initialize(start_station, last_station)
    @start_station = start_station
    @last_station = last_station
    @stations = [start_station, last_station]
    valid?
  end

  def valid?
    validate!
  end


  def add_station(station, number)
    if @stations.include?(station)
      puts "Такая станция уже есть"
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

  private
  def validate!
    raise "Станции должны быть записаны Хххххх" if @start_station !~ STATION_FORMAT
    raise "Станции должны быть записаны Хххххх" if @last_station !~ STATION_FORMAT
  end
end