arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if{|item| item.downcase.start_with?('s','w')}

a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']

a_words = a.map{|string| string.split}.flatten
p a_words
