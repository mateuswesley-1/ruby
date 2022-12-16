h1 = [[:mateus, 25]].to_h
h2 = {:mateus => 25}
h3 = {mateus: 25}

#p h1, h2, h3


h = {a:1, b:2, c:3, d:4}

=begin
1. Get the value of key `:b`.

2. Add to this hash the key:value pair `{e:5}`

3. Remove all key:value pairs whose value is less than 3.5

=end

h[:e] = 5

# cria copia de h
p h.select {|key, value| value<3.5}

# muda h
h.delete_if { |k, v| v < 3.5 }

puts h
