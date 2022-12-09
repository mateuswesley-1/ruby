a = Array.new(10)

a.each_with_index do
  |value, i|
  a[i] = (30+100*rand()).round(2)
end

a_sorted = a.sort

maior = a[-1]
menor = a[0]
p a
puts "Maior valor: #{maior}\nMenor Valor: #{menor}"
