# fazendo exeplos antigos de iteracao usando
# numerables methods
require 'pry-byebug'

## SELECT ##
def get_numbers(limite)

  begin
    limite = Integer(limite)
  rescue ArgumentError => e
    return e.message
  end

  begin
    limite = Math.sqrt(limite)**2
  rescue Math::DomainError
    return "Valor inserido menor que 0."
  end

  lista_filtrada = Array(1..limite).select do |element|
    element%2!=0 && element%3==0
  end
end


puts "Entre com o limite do intervalo. [Inteiro maior que 0]"
limite = gets.chomp
lista = get_numbers(limite)

soma = lista.reduce{|soma, num| soma + num}

puts "Soma de todos os números ímpares e múltiplos de 3 entre 0 e #{limite}: "
puts "#{lista.join('+')} = #{soma}"
