# Métodos

# Cria lista com numeros de input do usuario
def criar_lista(num)
  lista = Array.new()
  for i in 0...num
    print "Entre com o valor #{i} da lista: "
    lista[i] = gets.chomp.to_i
  end
  lista
end

# Soma os valores de uma array
def soma_array(a)
  soma = 0
  for i in 0...a.length
    soma += a[i]
  end
  soma
end

# Separa uma lista e cria listas com pares e impares
def separar_lista(lista)
  lista_par_impar = [[],[]]
  lista.each do |x|
    if x%2==0
      lista_par_impar[0] << x
    else
      lista_par_impar[1] << x
    end
  end
  lista_par_impar
end

# validandos dados
puts "Quantos números vc quer adicionar na sua lista?"
tamanho_lista = gets.chomp.to_i

while tamanho_lista<=0 do
  puts "Entre com um número inteiro válido!"
  tamanho_lista = gets.chomp.to_i
end


lista = criar_lista(tamanho_lista)
lista_par_impar = separar_lista(lista)


p lista
print "Soma dos números pares da lista:"
puts "#{lista_par_impar[0].join('+')} = #{soma_array(lista_par_impar[0])}"
print "Soma dos números ímpares da lista:"
puts "#{lista_par_impar[1].join('+')} = #{soma_array(lista_par_impar[1])}"
