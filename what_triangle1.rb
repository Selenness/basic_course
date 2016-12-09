puts "Введите длины сторон треугольника"

info = gets.chomp.split(', ', 3)
a = info[0].to_f
b = info[1].to_f
c = info[2].to_f

if a > b && b > c
  hip = a
  if a ** 2 == b ** 2 + c ** 2
    puts "Треугольник прямоугольный"
  else
    puts "Треугольник не прямоугольный"
  end
elsif b > c
  hip = b
  if b ** 2 == a ** 2 + c ** 2
   puts "Треугольник прямоугольный"
  else
    puts "Треугольник не прямоугольный"
  end
else
  hip = c
  if c ** 2 == a ** 2 + b ** 2
    puts "Треугольник прямоугольный"
  else
    if a == b && b == c && c == a
      puts "Треугольник не прямоугольный, равносторонний"
    elsif a == b || b == c || c == a
      puts "Треугольник не прямоугольный, равнобедренный"
    else
    end
  end
end