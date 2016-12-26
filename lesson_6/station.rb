class Station

  attr_accessor :name, :trains

  @@instances = {}

  NAME_FORMAT = /[А-Я][а-я]+/

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    puts "Станция #{name} создана."
    @@instances[name] = self
  end

  def valid?
    validate!
  rescue
    false
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
    raise "Неверный формат названия станции" if name !~ NAME_FORMAT
    true
  end

end
