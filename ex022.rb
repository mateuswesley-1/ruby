# verificar se n é divisível por todos os números entre
# 2 e n/2

print "digite um número: "
num = gets.chomp.to_i

divisores = [1]
for i in 2..(num/2)
  if num%i==0
    divisores << i
  end
end

divisores << num
p "Divisores: #{divisores}"
