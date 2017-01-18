class CargoCarriage < Carriage
  attr_reader :total_space, :taken_space

  def initialize(number, total_space)
    super
    @type = 'cargo'
    @total_space = total_space
    @taken_space = 0
  end

  def take_space(amount)
    if @taken_space + amount <= @total_space
      @taken_space += amount
    else
      throw 'Not enough empty space'
    end
  end

  def available_space
    @total_space - @taken_space
  end

  def info
    super
    puts "Объем всего - #{@total_space}"
    puts "Свободно - #{available_space}"
  end

end