class Station
  include Validation
  attr_accessor :name, :trains

  validate :name, :format, /[A-Z][a-z]+/

  @@instances = {}

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

  def accept_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_type_list( type=nil )
    @trains.each { |t| puts "\tПоезд - #{t.number}" if type == nil? || t.type }
  end

  def each_train(&block)
    @trains.each { |train| yield train }
  end

end
