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
  # store all users
  @@users = []

  def self.users
    @@users
  end

  def initialize
    @secret_word = WORDS.sample
    @draw = Array.new(@secret_word.length, '_')
    @tried_letters = []
    @wrong_tries = 0
    @user = read_user_name
    @@users.push(@user)
  end

  def save_game(user_name)
    Dir.mkdir('saves') unless Dir.exist? 'saves'
    filename = "saves/game_#{user_name}.txt"

    File.open(filename, 'w') do |file|
      file.puts(self.inspect)
    end
  end

  def read_user_name
    loop do
      puts 'Provide a valid username: '
      @user = gets.chomp.strip
      unless @@users.include? @user
        @@users << @user
        break
      end
      next
    end
    save_user
  end

  def save_user
    file_users = 'saves/users.txt'
    if File.exist? file_users
      File.open(file_users, 'a') do |file|
        file.puts(@user)
      end
    else
      File.open(file_users, 'w') do |file|
        file.puts(@user)
      end
    end
  end
  def read_letter
    while true
      puts "Tried letters: #{@tried_letters}"
      puts "Wrong tries: #{@wrong_tries}"
      feedback
      while true
        puts "\n\n"
        puts "********************************************************"
        puts "\n\n"
        print "Try a letter, or write 'save' to save the game: "
        @letter = gets.chomp.strip.downcase
        # save the game
        break unless @letter == 'save'

        puts "Game saved!"
        save_game(@user)
        next
      end
      # check if is a letter or is has been already choosen
      next if invalid_letter?

      @tried_letters << @letter
      break
    end
  end

  def check_letter
    letters_changed = false
    @secret_word.split('').each_with_index do |char, idx|
      if char == @letter
        @draw[idx] = @letter
        letters_changed = true
      end
    end
    @wrong_tries += 1 if letters_changed == false
  end

  def invalid_letter?
    @tried_letters.include?(@letter) || @letter.match?(/[^a-zA-Z]/)
  end

  def feedback
    puts @draw.join(' ').to_s
  end

  def round
    read_letter
    check_letter
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
    @wrong_tries < MAX_TRY && @secret_word != @draw.join
  end
end
