class Train
  attr_accessor :route
  attr_reader :number, :type, :carriage, :speed

  def initialize(number, type, carriage)
    @number = number
    @type = type
    @carriage = carriage
    @speed = 0
    @current_station = 0
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

  def move_to_next
    @current_station = @route[station + 1]
  end

  def move_to_back
    @current_station = @route[station - 1]
  end

  def show_station
    @route.each do |station|
      if @route.first
        puts "Текущая станция - #{@route[station]}. Следующая станция - #{@route[station + 1]}."
      else
        if @route.last
          puts "Предыдущая станция - #{@route[station - 1]}. Текущая станция - #{@route[station]}."
        else
          puts "Предыдущая станция - #{@route[station - 1]}. Текущая станция - #{@route[station]}. Следующая станция - #{@route[station + 1]}"
        end
      end
    end
  end
end