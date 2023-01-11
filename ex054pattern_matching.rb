# Pattern matching

# especifica padroes a quais alguns dados
# devem estar em conformidade e verifica
# se isso ocorre, ent'ao descontroi os dados de
# acordo com esse padrao

# Nesse caso e verificado se os dados estao em conformidade
# com o padrao indicado pelo numero de variaveis
# (temos 3 variaveis, logo precisamos ter uma lista com 3 valores, nao 4)

[1, 2, 3, 4] => [a, b, *c]

# Uma forma de ocorrer o pattern match e
# usando o operador "splat"
# que indica que a variavel pode
# receber qualquer numero de argumentos,
# entao nesse caso existe um pattern match.
# 1 vai pra a
# 2 vai pra b
# e o resto vai pra c, ja que indicamos que c
# pode receber qualquer quantidade de argumentos,
# e converte em array todos os valores passados
# a variavel c

#[1, 2, 3, 4] => [a, b, *c]


# Pattern match com Hash
hash = { a: 1, b: 2, c: 3, d: 4 }
a, b, *c = *hash

# aqui o resultado e que hash e transformado
# em uma array de arrays com pares key values
# a e b recebe somente um desses pares, enquanto
# *c recebe o resto


# Usando one line pattern matching

hash => { a:, b:, **c}

=begin
> a
=> 1
> b
=> 2
> c
=> {:c=>3, :d=>4}
=end



# Utilizando o case
# aqui o case so executa o bloco onde existe matching
# entre valores e o padrao indicado

valores = [1, 2, 3]
case valores
in [a]
  puts "O valor é #{a}"
in [a, b]
  puts "Os valores são: #{a} e #{b}"
in [a, b, c]
  puts "Os valores são: #{a}, #{b} e #{c}"
end

# e fomos capazes de desconstruir esses dados
# podendo usar as variaveis separadas como deserjarmos

case valores
  in [a]
    puts "O valor é #{a}"
  in [a, b]
    puts "Os valores são: #{a} e #{b}"
  in [a, b, c]
    puts "O produto entre os valores e #{a*b*c}"
  end



# matching de valores

traducoes = [:br, 'Bom dia', :en, 'Good morning']
# aqui alem de precisarmos de matching no numero de variaveis dentro da array, precisamos do matching
# dos valores especificos
case traducoes
in [:br, texto_br, :es, texto_es]
puts "'#{texto_br}' em Espanhol é '#{texto_es}'"
in [:br, texto_br, :en, texto_en]
puts "'#{texto_br}' em Inglês é '#{texto_en}'"
else
puts "Sem tradução"
end


# Match pode ocorrer, mas nao queremos todos os valores

valores = [1, 2, 3]
case valores
  in [_, dois, _]
    puts " O segundo valor e #{dois}"
end


# Pin operator
# no lugar de criar uma nova variavel
# para o terceiro valor, verificamos se ela tem o mesmo valor que alguma variavel ja criada, se tiver
# tem match e ela e ignorada

case [1, 2, 1]
in [a, b, ^a]
  puts "Os valores com pin são: #{a} e #{b}"
end

# arrow assignment
# no lugar de usar variaveis, usamos nome de classes
# entao o o match ocorre em nivel local, e e verificado se os tipos dos dados correspondem
# aquela classe
traducoes = [:br, 'Bom dia cachorra', :en, "Good morning female dog"]

case traducoes
  in [Symbol, String, Symbol, String] => found
    p found
end
