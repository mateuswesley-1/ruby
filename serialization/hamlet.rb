require 'open-uri'
require 'pry-byebug'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

file_web = URI.open(url)
local_filename = 'hamlet.txt'

# getting text from web txt and writing it on
# a local file
File.open(local_filename, 'w') do |file|
  file.write(file_web.read)
end


# getting the local file text and
# storing it in a array
texto = []
File.open(local_filename, 'r') do |file|
  until file.eof?
    texto << file.readline
  end
end


hamlet_line = false
texto.each do |line|
  hamlet_line = false if (hamlet_line == true && (line.strip.empty? || line.match?(/^  [A-Z]/)))

  hamlet_line = true if line.match? 'Ham\.'

  puts line if hamlet_line == true
end


=begin
is_hamlet_speaking = false
File.open("hamlet.txt", "r") do |file|
   file.readlines.each do |line|

      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham\.")

      puts line if is_hamlet_speaking == true
   end
=end
