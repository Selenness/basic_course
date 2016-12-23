class Station

  attr_accessor :name, :trains

  @@instances = {}

  NAME_FORMAT = /[А-Я][а-я]+/

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    puts "Станция #{name} создана."
    @@instances[name] = self
    valid?
  end

  def valid?
    validate!
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

  private
  def validate!
    raise "Не верный формат названия станции" if name !~ NAME_FORMAT
    true
  end

end
