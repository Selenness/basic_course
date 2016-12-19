class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    puts "Станция #{station} создана."
  end

  def accept_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_type_list(type=nil)
    @trains.each { |t| puts "\tПоезд - #{t.number}" if type == nil? || t.type }
  end

end
