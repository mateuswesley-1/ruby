# validandos dados
print "Razao da PA:"
razao = gets.chomp.to_i

print "Valor inicial: "
inicial = gets.chomp.to_i

def gerar_pa(inicial, razao)
  numeros = Array.new()
  i = 0
  10.times do
    numeros << (inicial + i*razao)
    i+=1
  end
  numeros
end

p gerar_pa(inicial, razao)
