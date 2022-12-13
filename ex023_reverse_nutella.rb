print "Escreva alguma coisa: "
texto = gets.chomp.strip.upcase
texto.gsub!(' ','')

puts texto
puts texto.reverse

if texto == texto.reverse
  puts "A palavra é um palindrono"
else
  puts "A palavra não é um palindrono"
end

