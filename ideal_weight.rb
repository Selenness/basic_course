puts "Напишите своё имя"
name = gets.chomp
puts "Напишите свой рост"
height = gets.chomp.to_i
ideal_weight = height - 110

if ideal_weight < 0
  puts "#{name}, ваш вес уже оптимальный"
else
  puts "#{name}, ваш идеальный вес - #{ideal_weight}"
end
