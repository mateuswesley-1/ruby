def rot13(secret_messages)
  secret_messages.map do |string|
    string.split('').each_with_index do |letter, index|
      string[index] = ('a'.ord+((letter.ord - 'a'.ord + 13)%26)).chr
    end
  end
end

p rot13 ['aba', 'eba']

