a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"

# chamar o método vai mudar a array, por causa do que significa atribuir uma variável a outra no caso de array

# se eu tenho a = [1,2,3]
# e eu faço b = a
# a e b apontam para o mesmo objeto na memória, então mudar a, muda o objeto na memória, logo muda o valor de b também.
mutate(a)
p "After mutate method: #{a}"
