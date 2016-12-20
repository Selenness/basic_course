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
      puts "7. Выход из программы"

      answ = gets.to_i

      case answ
        when 1
          create_station
        when 2
          create_train
        when 3
          add_carriage
        when 4
          delete_carriage
        when 5
          set_station
        when 6
          show_trains_on_stations
      end
    end while answ != 7
  end

  private

  def create_station
    puts "Введите название станции"
    station = gets.chomp
    @stations[station] = Station.new(station)
  end

  def create_train
    puts "Введите номер поезда"
    number = gets.chomp.to_i

    puts "Какой поезд?"
    puts "1. Пассажирский"
    puts "2. Грузовой"
    type = gets.chomp.to_i
    @trains[number] = type == 1 ? PassengTrain.new(number) : CargoTrain.new(number)
  end

  def add_carriage
    puts "Введите номер поезда"
    number_tr = gets.to_i
    puts "Введите номер вагона"
    number_car = gets.to_i
    @trains[number_tr].add_carriage(@trains[number_tr].type == "cargo" ? CargoCarriage.new(number_car) : PassengCarriage.new(number_car))
  end

  def delete_carriage
    puts "Введите номер поезда"
    number_tr = gets.to_i
    @trains[number_tr].delete_carriage
  end

  def set_station
    puts "Введите номер поезда"
    number = gets.chomp.to_i
    puts "Введите название станции"
    st_name = gets.chomp
    @stations[st_name].accept_train(@trains[number])
    @stations[st_name].show_trains_type_list
  end

  def show_trains_on_stations
    @stations.each {|k, st|
      puts "Станция - #{st.name}"
      st.show_trains_type_list
    }
  end
end

program = Main.new
program.run





