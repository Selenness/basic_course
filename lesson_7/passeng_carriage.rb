class PassengCarriage < Carriage

  attr_reader :total_seats, :taken_seats

  def initialize(number, total_seats)
    super
    @type = "passeng"
    @total_seats = total_seats
    @taken_seats = 0
  end

  def take_seat
    if @taken_seats <= @total_seats
      @taken_seats += 1
    else
      throw 'No spare seats!'
    end
  end

  def spare_seats
    @total_seats - @taken_seats
  end

  def info
    super
    puts "Мест всего - #{@total_seats}"
    puts "Свободно - #{spare_seats}"
  end
end