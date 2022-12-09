
# recebe um numero inteiro e armazena numa array todos os números
# ímpares e multiplos de 3 entre 0 e esse numero
def get_numbers(limite)
  if limite<0
    limite *=-1
  end

  lista = []

  for i in 1..limite
    if (i%2!=0) && (i%3==0)
      lista << i
    end
  end
  lista
end

#soma todos os números de uma array
def soma_array(a)
  soma = 0
  for i in 0...a.length
    soma += a[i]
  end
  soma
end

puts "Entre com o limite do intervalo. [Inteiro maior que 0]"
limite = gets.chomp.to_i
lista = get_numbers(limite)

puts "Soma de todos os números ímpares e múltiplos de 3 entre 0 e #{limite}: "
puts "#{lista.join('+')} = #{soma_array(lista)}"

