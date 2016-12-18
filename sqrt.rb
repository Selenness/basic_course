puts "Введите три числа"

info = gets.chomp.split(', ', 3)
a = info[0].to_i
b = info[1].to_i
c = info[2].to_i

d = (b ** 2) - (4 * a * c)


if d < 0
  puts "Корней нет!"
else
  x1 = ( (- b) + Math.sqrt(d)) / (2 ** a)
  x2 = ( (- b) - Math.sqrt(d)) / (2 ** a)
  puts "#{ x1 }"
  puts "#{ x2 }"
end