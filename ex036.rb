def string_numerica(string)
  begin
    Integer(string)
    return true
  rescue
    false
  end
end

def number_range(range_start, range_end, number)
  # Checando se os inputs sao inteiros
  unless string_numerica(number)
    raise "Entre com um número válido!"
  end

  unless string_numerica(range_start)
    raise "Entre com um número INICIAL válido!"
  end

  unless string_numerica(range_end)
    raise "Entre com um número FINAL válido!"
  end

  if number<=range_end && number>=range_start
    true
  else
    false
  end

end

def ascii_translator(number)
  unless string_numerica(number)
    raise "Valor '#{number}' nao e um inteiro valido. Valor inserido "
    return
  end

  unless number_range(0, 255, number.to_i)
    raise "Numero #{number.to_i} fora do range 0-255"
    return
  end

  number.to_i.chr
end

puts ascii_translator('mateus')

