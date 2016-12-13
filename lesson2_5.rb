def is_leap(year)
   (year % 400 == 0) || ((year % 4 == 0 ) && ( year % 100 != 0 ))
end

puts "Введите дату"
info = gets.chomp.split('.', 3)
day = info[0].to_i
month = info[1].to_i
year = info[2].to_i

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
sum = day
month_days[0..month - 2].each { |days_count| sum += days_count } if month >= 2
sum += month > 2 && is_leap(year) ? 1 : 0
puts sum
