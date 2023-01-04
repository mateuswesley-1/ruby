require_relative 'get_data'
require_relative 'basic_serializable'
require 'json'

class Hangman
  # Simple Hangman game with a save option

  # module that download words from net and creates a array
  include Getdata

  # Serialization module
  include BasicSerializable

  # attr_reader :secret_word, :wrong_tries, :draw
  # getting array of words using module methods
  WORDS = Getdata.txt_to_array
  # number of tries before lose
  MAX_TRY = 7



  def initialize
    @user
    @game_status
    @secret_word = WORDS.sample
    @draw = Array.new(@secret_word.length, '_')
    @tried_letters = []
    @wrong_tries = 0
    @game_mode = game_mode
    case @game_mode
    when 1
      @user = read_user_name
    when 2
      load_game
    end

  end

  def save_game(user_name)
    Dir.mkdir('saves') unless Dir.exist? 'saves'
    filename = "saves/game_#{user_name}.json"

    File.open(filename, 'w') do |file|
      file.puts(self.serialize)
      save_user
    end

  end

  def read_user_name
    puts 'Provide a valid username: '
    gets.chomp.strip
  end

  def game_mode
    puts "1 - New Game \n2 - Load game"
    gets.chomp.to_i
  end

  def load_game
    choose_save
    read_save_data
  end

  # print users that have a saved game
  def saved_users
    @saved_users = []
    File.open('saves/users.txt', 'r') do |file|
      @saved_users << file.readline.chomp until file.eof?
    end
  end

  def choose_save
    print "Users with saved games: "
    puts @saved_users
    until @saved_users.include? @user
      puts "Which user are you?"
      @user = gets.chomp.strip.downcase
    end
  end

  def read_save_data
    file_name = "game_#{@user}.json"
    File.open(file_name, 'r') do |file|
      unserialize(file.read)
    end
  end

  def save_user
    file_users = 'saves/users.txt'
    open_mode = File.exist?(file_users) ? 'a' : 'w'

    File.open(file_users, open_mode) do |file|
      file.puts(@user)
    end



  end

  def read_letter
    while true
      # give the user feedback, wrong letters, right letters etc..
      feedback
      # get user letter
      while true
        puts "\n\n"
        puts "********************************************************"
        puts "\n\n"
        print "Hello, #{@user.capitalize}. Try a letter, write 'save' to save the game, or 'exit' to leave: "
        @letter = gets.chomp.strip.downcase

        # close the game
        if @letter == 'exit'
          @game_status = false
          return
        end

        # save the game
        break unless @letter == 'save'

        puts 'Game saved!'
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
    puts "Tried letters: #{@tried_letters}"
    puts "Wrong tries: #{@wrong_tries}"
    puts @draw.join(' ').to_s
  end

  def round
    read_letter
    check_letter
  end

  def game
    while @game_status == true
      @game_status = game_on?
      round
      check_win
    end

    puts end_msg
  end

  def game_on?
    @wrong_tries < MAX_TRY && @secret_word != @draw.join
  end

  def check_win
    @winner = @secret_word == @draw.join
  end

  # msg for the end of the game
  def end_msg
    return "\nCongratulations, #{@user.capitalize}! you got the secret word right" if @winner
    return "\nSee you later, #{@user.capitalize}!" if @letter == 'exit'
    return "\nYou failed to guess the secret word, #{@user.capitalize}. Better luck next time" if @winner == false && @letter != 'exit'
  end
end
