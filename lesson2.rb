months = { january: 31, february: 28, march: 31, april: 30, may: 31, june: 30, july: 31, august: 31, september: 30, october: 31, november: 30, december: 31 }

months.each do |month, days|
  puts month if days == 30
end

# второе задание
arr = []
ind = 10
while ind < 100 do
  ind = ind + 5
  arr << ind
end
puts arr

# третье задание
arr = [0, 1, 1]
i = 3
while i < 100 do
  f = arr[i - 1] + arr[i - 2]
  arr << f
  i += 1
end
puts "[#{arr.join(', ')}]"

# четвертое задание

alf = ('a'..'z').to_a
vowels = %w(a e i o u y)
vows = {}

alf.each_with_index do |letter, i|
    if vowels.include?(letter)
     vows[letter] = i + 1
    end
end
puts vows

