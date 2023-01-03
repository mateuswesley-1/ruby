require_relative 'get_data'


class Hangman
  # Simple Hangman game with a save option

  # module that download words from net and creates a array
  include Getdata

  # attr_reader :secret_word, :wrong_tries, :draw

  # getting array of words using module methods
  WORDS = Getdata.txt_to_array

  # number of tries before lose
  MAX_TRY = 7

  def initialize
    @secret_word = WORDS.sample
    @draw = Array.new(@secret_word.length, '_')
    @tried_letters = []
    @wrong_tries = 0
  end

  def read_letter
    while true
      puts "Tried letters: #{@tried_letters}"
      puts "Wrong tries: #{@wrong_tries}"
      print 'Try a letter: '
      letter = gets.chomp.strip.downcase
      next if invalid_letter?(letter)

      @tried_letters << letter
      break
    end
    letter
  end

  def check_letter(letter)
    letters_changed = false
    @secret_word.split('').each_with_index do |char, idx|
      if char == letter
        @draw[idx] = letter
        letters_changed = true
      end
    end
    @wrong_tries += 1 if letters_changed == false
  end

  def invalid_letter?(letter)
    @tried_letters.include?(letter) || letter.match?(/[^a-zA-Z]/)
  end

  def feedback
    puts @draw.join(' ').to_s
  end

  def round
    feedback
    letter = read_letter
    check_letter(letter)
    puts
  end

  def game
    round while game_on?
    if @secret_word == @draw.join
      puts "Congratulations! You win with #{@wrong_tries} wrong tries!"
    else
      puts "You lose. You can try another time! don't be sad!"
    end
  end

  def game_on?
    @wrong_tries <= MAX_TRY && @secret_word != @draw.join
  end
end

mateus = Hangman.new
p mateus
mateus.game


