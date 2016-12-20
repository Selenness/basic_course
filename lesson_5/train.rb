class Train
  include Producer
  include InstanceCounter

  attr_accessor :route
  attr_reader :number, :type, :carriage, :speed, :station_ind

  @@trains = {}


  def self.find(number)
    @@trains.key?(number) ? @@trains[number] : puts('Поезда с таким номером нет')
  end


  def initialize(number)
    @number = number
    @carriage = []
    @speed = 0
    @station_ind = 0
    puts "Поезд №#{number}: \"Я родился!\""
    @@trains[number] = self
    register_instance
  end

  def speed_up(speed)
    self.speed += speed
  end

  def show_speed
    puts "Скорость поезда - #{self.speed}"
  end

  def stop
    if stopped?
      puts "Поезд уже остановлен"
    else
      self.speed = 0
    end
  end

  def add_carriage(carriage)
    if stopped?
      if self.type == carriage.type
        @carriage << carriage
        puts "Вагон #{carriage.number} прицеплен к поезду!"
      else
        puts "Не подходящий тип вагона"
      end
    else
      puts "Остановите поезд"
    end
  end

  def delete_carriage
    if stopped?
      if @carriage.size > 0
        car = @carriage.pop
        puts "Вагон #{car.number} отцеплен от поезда. Осталось #{@carriage.length} вагонов."
      else
        puts "Вагонов больше нет"
      end
    else
     puts "Остановите поезд"
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

  # этот метод нельзя будет вызвать из клиентского кода, но надо чтобы его наследовли подклассы
  protected

  def stopped?
    @speed = 0
  end
end

