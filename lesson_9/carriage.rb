class Carriage
  include Producer
  include InstanceCounter
  include Validation

  attr_reader :number, :type
  validate :number, :presence
  validate :type, :presence


  def initialize(number)
    @number = number
    register_instance
    validate!
  end

  def info
    puts 'Вагон №#{@number}, #{@type == "cargo" ? "грузовой" : "пассажирский"}'
  end

end