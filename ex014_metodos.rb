a = 5

def metodo(num)
  num += 2
end

# Mesmo que usemos o método na variável a, a variavel ontinua com o mesmo valor
# pois dentro da função, o valor dessa variável é atribuido a uma outra variável que so existe localmente, "num", e a função retorna o valor de "num".
# A conta não é feita com "a" em si, so usamoso valor de "a" como valor para "num"
metodo(a)



