class Carriage

  include Producer
  include InstanceCounter

  attr_reader :number, :type

  def initialize(number)
    @number = number
    register_instance
  end

  def info
    puts "Вагон №#{@number}, #{@type == "cargo" ? "грузовой" : "пассажирский"}"
  end
end