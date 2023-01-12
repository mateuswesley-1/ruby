def logger
  yield
end

logger { puts 'hello from the block' }

logger do
  p [1, 2, 3]
end


def double_vision
  yield
  yield
end

# yield e uma keyword que para a funcao para realizar
# o bloco que a funcao recebeu como argumento
double_vision { puts "How many fingers am I holding up?" }
#=> How many fingers am I holding up?
#=> How many fingers am I holding up?
