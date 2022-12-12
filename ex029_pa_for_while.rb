
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

def gerar_pa_each(inicio, razao, num)
  numeros = []
  (0...num).each do
    |i|
    numeros << (inicio + i*razao)
  end
  numeros
end

def imprimir(inicio, razao, num)
  while true
    array_nums = gerar_pa_each(inicio, razao, num)
    p array_nums.join(' --> ')
    puts "Quantos numeros a mais voce quer mostrar?"
    num = gets.chomp.to_i
    if num==0
      break
    else
      inicio = array_nums[-1]+razao
      next
    end
  end
end

puts "Entre com a razão da PA"
razao = gets.chomp.to_i

puts "Entre com o valor inicio: "
inicio = gets.chomp.to_i

imprimir(inicio, razao, 10)
