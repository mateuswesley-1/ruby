
def somar_nums
  numeros = []
  i=0
  while true
    puts "Entre com o numero #{i+1}: "
    num = gets.chomp.to_i

    if num == 0
      break
    end

    numeros << num
    i+=1
  end
  p "Quantidade de Numeros: #{i}"
  "(#{numeros.join(")+(")}) = #{numeros.sum}"
end

p somar_nums
