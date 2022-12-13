# Cria uma Hash onde o valor padrao e [], ou seja
def divisores_num
  divisores = Hash.new()


  while true
    print "digite um número: "
    num = gets.chomp.to_i

    if (num<=0)
      break
    end

    divisores[num] = [1, num]

    for i in 2..(num/2)
      if num%i==0
        divisores[num].insert(-2, i)
      end
    end
  end
  divisores
end

todos_divisores = divisores_num()

todos_divisores.each do |key, value|
  # para o caso num = 1
  value.uniq!
  puts "-------------------"
  p "#{key}: #{value}"
  value.each do |divisor|
    puts "\n"
    puts "#{key} / #{divisor} = #{key/divisor}"
  end
end


