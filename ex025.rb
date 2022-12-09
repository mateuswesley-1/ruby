# Cria lista com numeros de input do usuario
def criar_lista(num)
  lista = Array.new()
  for i in 0...num
    lista[i] = rand(0..10)
  end
  lista
end

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

# soma todos os numeros de uma array
# usando each
def soma_array(a)
  soma = 0
  a.each do |element|
    soma+=element
  end
  soma
end

def separar_lista(lista)
  lista_par = lista.select{|number| number%2==0}
  lista_impar = lista.select{|number| number%2!=0}
  hash_num = {"par"=>lista_par, "impar"=>lista_impar}
end

# validandos dados
puts "Quantos números vc quer adicionar na sua lista?"
tamanho_lista = gets.chomp.to_i

while tamanho_lista<=0 do
  puts "Entre com um número inteiro válido!"
  tamanho_lista = gets.chomp.to_i
end


lista = criar_lista(tamanho_lista)
hash_par_impar = separar_lista(lista)

p lista
print "Soma dos números pares da lista:"
puts "#{hash_par_impar['par'].join('+')} = #{soma_array(hash_par_impar['par'])}"
print "Soma dos números ímpares da lista:"
puts "#{hash_par_impar['impar'].join('+')} = #{soma_array(hash_par_impar['impar'])}"
