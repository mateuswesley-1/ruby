require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

file_web = URI.open(url)
local_filename = 'hamlet.txt'

# getting text from web txt and writing it on
# a local file
until file_web.eof?
  File.open(local_filename, 'a') do |file|
    file.write(file_web.readline)
  end
end

# getting the local file text and
# storing it in a array
texto = []
File.open(local_filename, 'r') do |file|
  until file.eof?
    texto << file.readline
  end
end

texto.each_with_index do |line, idx|
  # print every 42nd line to scream
  puts line if idx % 42 == 41
end




