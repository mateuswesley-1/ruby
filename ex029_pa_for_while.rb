puts "Entre com a razão da PA"
razao = gets.chomp.to_i

puts "Entre com o valor inicio: "
inicio = gets.chomp.to_i

def gerar_pa_for(inicio, razao)
  numeros = []
  for i in 0...10
    numeros << (inicio + i*razao)
  end
  numeros
end

def gerar_pa_while(inicio, razao)
  numeros = []
  i=0
  while i<10 do
    numeros << (inicio + i*razao)
    i+=1
  end
  numeros
end

def gerar_pa_until(inicio, razao)
  numeros = []
  i = 0
  until i==10 do
    numeros << (inicio + i*razao)
    i += 1
  end
  numeros
end

def gerar_pa_loop(inicio, razao)
  numeros = []
  i = 0
  loop do
    numeros << (inicio + i*razao)
    i += 1
    if i==10
      break
    end
  end
  numeros
end

def gerar_pa_each(inicio, razao)
  numeros = []
  (0...10).each do
    |i|
    numeros << (inicio + i*razao)
  end
  numeros
end

p gerar_pa_for(inicio, razao)
p gerar_pa_while(inicio, razao)
p gerar_pa_until(inicio, razao)
p gerar_pa_loop(inicio, razao)
p gerar_pa_each(inicio, razao)
