num_sorteado = rand(0..9)

puts "Tente advinhar o numero entre 0 e 9: "
num_user = gets.chomp.to_i
tentativas = [num_user]

until num_user == num_sorteado do
  puts "Errou! Tente Novamente: "
  num_user = gets.chomp.to_i
  while tentativas.include? num_user
    puts "Voce ja tentou esse numero. Tente outro:"
    num_user = gets.chomp.to_i
  end
  tentativas << num_user
end

puts "Numero de tentativas: #{tentativas.length}"
puts "Valor sorteado: #{num_sorteado}"

