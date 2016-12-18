class Train
  attr_accessor :route
  attr_reader :number, :type, :carriage, :speed, :station_ind

  def initialize(number, type, carriage)
    @number = number
    @type = type
    @carriage = carriage
    @speed = 0
    @station_ind = 0
  end

  def speed_up(speed)
    self.speed += speed
  end

  def show_speed
    puts "Скорость поезда - #{self.speed}"
  end

  def stop
    self.speed = 0
  end

  def add_carriage
    if speed == 0
     @carriage += 1
    else
      puts "Остановите поезд"
    end
  end

  def delete_carriage
    if speed > 0
      puts "Остановите поезд"
    elsif @carriage == 0
      puts "Уже нет вагонов"
    else
      @carriage -= 1
    end
  end

  def current_station
    @route.stations[@station_ind]
  end

  def previous_station
    @route.stations[@station_ind - 1]
  end

  def next_station
     @route.stations[@station_ind + 1] if @station_ind < @route.stations.size
  end

  def move_to_next
    if @station_ind + 1 < @route.stations.size
      @station_ind += 1
    else
      puts "Это последняя станция"
    end
  end

  def move_to_back
    if @station_ind > 0
      @station_ind -= 1
    else
      puts "Это первая станция"
    end
  end

  def set_route(route)
    @route = route
  end

end

