require 'pry-byebug'

def find_word_lengths(word_list)
  # use #reduce to iterate through each item of the word_list (an array)
  # return a hash with each word as the key and its length as the value
  # hint: look at the documentation and review the reduce examples in basic enumerable lesson
  word_list.reduce(Hash.new(0)) do |hash, word|
    hash[word] += word.length
    # Essa linha e necessaria, pois aparentemente o return do bloco e
    # usado como novo valor de hash
    hash
  end
end

p find_word_lengths ['mateus','wesley','medeiros']


