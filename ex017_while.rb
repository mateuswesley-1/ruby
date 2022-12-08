# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

puts "Oi vamos brincar? Escreva STOP quando quiser parar"
string = gets.chomp.upcase
while string != 'STOP' do
  puts "Paro ou continuo?"
  string = gets.chomp.upcase
end



=begin
loop do
  puts "Paro ou continuo?"
  answer = gets.chomp.upcase
  if answer == 'STOP'
    break
  end
end
=end
