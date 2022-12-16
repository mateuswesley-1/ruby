def display_guess_order(guesses)
  # use #each_with_index to iterate through each item of the guesses (an array)
  # use puts to output each list item "Guess #<number> is <item>" to console
  # hint: the number should start with 1
  guesses.each_with_index do |item, i|
    puts "Guess #{i+1} is #{item}"
    puts "Guess #<i> is <item>"
  end
end

display_guess_order(['mateus', 'weley','medeiros'])
