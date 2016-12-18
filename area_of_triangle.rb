puts "Напишите основание и высоту треугольника"
info = gets.chomp
info = info.split(', ', 2)
basis = info[0].to_i
height = info[1].to_i
puts "Площадь треугольника  -  #{ basis * height * 1/2.0 }"