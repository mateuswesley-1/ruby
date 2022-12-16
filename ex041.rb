require 'pry-byebug'

def get_numbers(tamanho)
  begin
    tamanho = Integer(tamanho)
  rescue ArgumentError => e
    return e.message
  end

  begin
    Math.sqrt(tamanho)**2
  rescue Math::DomainError
    return "Valor inserido menor que 0."
  end

  lista= Array(0...tamanho).map do |i|
    print "Entre com o valor #{i}: "
    gets.chomp.to_i
  end

  separar_lista(lista)
end

def separar_lista(lista)
  numeros = {:impar => [], :par => []}
  numeros[:impar] = separar_impar(lista)
  numeros[:par] = separar_par(lista)
  numeros
  end
end

def separar_impar(lista)
  lista.select{|num| num%2!=0}
end

def separar_par(lista)
  lista.select{|num| num%2==0}
end

# validandos dados
puts "Quantos números vc quer adicionar na sua lista?"
tamanho_lista = gets.chomp

lista = get_numbers(tamanho_lista)

puts "Soma dos números pares da lista:"
puts "#{lista[:par].join('+')} = #{lista[:par].reduce{|sum, num| sum+num}}"

puts "Soma dos números ímpares da lista:"
puts "#{lista[:impar].join('+')} = #{lista[:impar].reduce{|sum, num| sum+num}}"

