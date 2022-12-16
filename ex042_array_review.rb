#Array(1..10).each {|item| print "#{item} " if item > 5}
original_array = Array(1..10)
new_array = original_array.select {|item| item > 5 && item%2!=0}

original_array << 11
original_array.insert(0, 0)
original_array[-1] = 3

unique_array = original_array.uniq

p  "original_array: #{original_array}"
p  "unique_array: #{unique_array}"


