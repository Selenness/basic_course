require 'producer'
require 'instance_counter'
require 'my_accessor'
require 'validation'

class Train
  include Producer
  include InstanceCounter
  extend MyAccessor

  include Validation

  attr_accessor :route, :number
  attr_reader :type, :carriage, :speed, :station_ind

  attr_accessor_with_history :c, :b, :d
  strong_attr_accessor :f, String


  @@trains = {}

  validate :number, :presence
  validate :number, :format, /^[\dA-z]{3}-*[\dA-z]{2}$/i
  validate :type, :type, String


  def self.find(number)
    @@trains.key?(number) ? @@trains[number] : nil
  end


  def initialize(number)
    @number = number
    validate!
    @carriage = []
    @speed = 0
    @station_ind = 0
    @@trains[number] = self
    # register_instance
    puts "Поезд №#{number}: \"Я родился!\""
  end

  def speed_up(speed)
    self.speed += speed
  end

  def show_speed
    puts "Скорость поезда - #{self.speed}"
  end

  def stop
    if stopped?
      puts 'Поезд уже остановлен'
    else
      self.speed = 0
    end
  end

  def get_carriage(number)
    @carriage.find{ |car| car.number == number }
  end

  def add_carriage(carriage)
    if stopped?
      if self.type == carriage.type
        @carriage << carriage
        puts "Вагон #{carriage.number} прицеплен к поезду!"
      else
        puts 'Не подходящий тип вагона'
      end
    else
      puts 'Остановите поезд'
    end
  end

  def delete_carriage
    if stopped?
      if @carriage.size > 0
        car = @carriage.pop
        puts "Вагон #{car.number} отцеплен. Осталось #{@carriage.length} вагонов."
      else
        puts 'Вагонов больше нет'
      end
    else
     puts 'Остановите поезд'
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
      puts 'Это последняя станция'
    end
  end

  def move_to_back
    if @station_ind > 0
      @station_ind -= 1
    else
      puts 'Это первая станция'
    end
  end

  def add_route(route)
    @route = route
  end

  def each_carriage(&block)
    @carriage.each {|car| yield car}
  end

  def info
    puts "Поезд №#{@number}, #{@type == "cargo" ? "грузовой" : "пассажирский"}, вагонов: #{@carriage.length}"
  end

  protected

  def stopped?
    @speed = 0
  end

end

