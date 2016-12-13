puts "Введите название товара, цену, количество. Для окончания напишите 'стоп':"
purchases ={}
loop do
  input = gets.chomp.split(', ', 3)
  name_product = input[0]
  price = input[1].to_f
  quantity = input[2].to_f
  break if name_product == "стоп"
  purchases[name_product] = { price: price, quantity: quantity, amount: price * quantity }
end
sum = 0
purchases.each_value { |info| sum += info[:amount] }
puts purchases
puts  "Сумма всех покупок - #{sum}"