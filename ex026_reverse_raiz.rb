print "Escreva alguma coisa: "
texto = gets.chomp.strip.downcase
texto.gsub!(' ','')

def reverter(string)
  reversa = []
  string.split('').each_with_index do
    |letra, pos|
    reversa.unshift(letra)
  end
  reversa.join('')
end

p reverter(texto)
