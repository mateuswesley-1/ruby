## Implementando um metodo each usando o conceito de block e yield


# Criando uma classe que representa uma estrutura do tipo array
class Sarray
  attr_accessor :values

  # recebe os valores quebra eles e transforma numa variavel de instancia com
  # esses valores
  def initialize(*values)
    @values = values
  end

  # para cada valor de @values
  # para o metodo e executa o bloco dado como argumento do metodo each
  def each
    for i in 0...@values.length
      puts yield(@values[i])
    end
  end


end

array = Sarray.new(1, 2, 3, 10, 11, 54).values
array.each {|value| value*2}

