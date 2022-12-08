def recursao(i)
  print "#{i} "
  if (i>0)
    recursao(i-1)
  end
end

recursao(-100)


=begin versao do professor

def count_to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    count_to_zero(number-1)
  end
end

=end
