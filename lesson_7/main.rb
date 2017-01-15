require_relative 'instance_counter'
require_relative 'producer'
require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passeng_carriage'
require_relative 'passenger_train'

class Main

  def initialize
    @trains = {}
    @stations = {}
  end

  def run
    begin
      puts 'Напишите пункт из меню, который вы хотите сделать:'
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Добавить вагоны к поезду"
      puts "4. Отцепить выгоны у поезда"
      puts "5. Помещать поезда на станцию"
      puts "6. Просматривать список станций и список поездов на станции"
      puts "7. Список вагонов поезда"
      puts "8. Список поездов на станции"
      puts "9. Занять место или объем в вагоне"
      puts "10. Выход из программы"

      answ = gets.to_i

      case answ
        when 1
          begin
            create_station
          rescue => e
            puts e.message
            retry
          end
        when 2
          begin
            create_train
          rescue => e
            puts e.message
            retry
          end
        when 3
          add_carriage
        when 4
          delete_carriage
        when 5
          set_station
        when 6
          show_trains_on_stations
        when 7
          carriage_list
        when 8
          list_station_trains
        when 9
          occupy_space
      end
    end while answ != 10
  end

  private

  def create_station
    get_station_name
    @stations[@stan] = Station.new(@stan)
  end

  def create_train
    get_train
    puts "Какой поезд?"
    puts "1. Пассажирский"
    puts "2. Грузовой"
    type = gets.chomp.to_i
    @trains[@train_no] = type == 1 ? PassengTrain.new(@train_no) : CargoTrain.new(@train_no)
  end

  def add_carriage
    get_train
    @train = trains[number_tr]
    @train.add_carriage(select_car)
  end

  def delete_carriage
    get_train
    @train.delete_carriage
  end

  def set_station
    get_train
    get_station_name
    @station.accept_train(@train)
    @station.show_trains_type_list
  end

  def show_trains_on_stations
    @stations.each {|k, st|
      puts "Станция - #{st.name}"
      st.show_trains_type_list
    }
  end

  def carriage_list
    get_train
    puts "Поезд №#{@train_no}"
    @train.each_carriage { |car| car.info }
  end

  def list_station_trains
    get_station_name
    @stan.each_train {|train| train.info}
  end

  def occupy_space
    get_train
    get_car

    if @train.type == "cargo"
      puts "Введите занимаемый объем"
      amount = gets.to_f
      @car.take_space(amount)
    else
      @car.take_seat
    end

  end

  def select_car
    get_car
    if @train.type == 'cargo'
      puts 'Введите объем вагона'
      total_space = gets.to_f
      CargoCarriage.new(car_no, total_space)
    else
      puts 'Введите количество мест в вагоне'
      total_seats = gets.to_i
      PassengCarriage.new(car_no, total_seats)
    end
  end

  def get_train
    puts 'Введите номер поезда'
    @train_no = gets.to_i
    @train = @trains[@train_no]
  end

  def get_car
    puts "Введите номер вагона"
    @car_no = gets.to_i
    @car = @train.get_carriage(@car_no)
  end

  def get_station_name
    puts "Введите название станции"
    @stan = gets.chomp
    @station = @stations[@stan]
  end
end

program = Main.new
program.run





