def get_numbers(limite)
  if limite<0
    limite *=-1
  end

  numeros = {:impar => [], :par => []}

  for i in 1..limite
    if (i%2!=0)
      numeros[:impar] << i
    else
      numeros[:par] << i
    end
  end
  numeros
end

# Recebe uma hash e gera uma nova com as somas
def hash_soma(hash)
  begin
    soma = {}
    hash.each do |key, value|
      soma[key] = 0
      value.each{|num| soma[key]+=num}
    end
    soma
  rescue
    puts "Valor invalido! Entre com uma hash de arrays"
  end
end

print "Entre com o limite: "
limite = gets.chomp.to_i

numeros = get_numbers(limite)
numeros.each do
  |key, value|
  puts "#{key} => #{value.join(' + ')} = #{hash_soma(numeros)[key]}"
end
p hash_soma numeros
