=begin
require 'open-uri'

site = 'http://en.wikipedia.org/wiki'
page = 'naruto'
url = "#{site}/#{page}"

data = URI.open(url).read

open("naruto.html", "w") do |local_file|
local_file.write(data)
=end

require 'rubygems'
require 'rest-client'

url = 'http://en.wikipedia.org/wiki/naruto'


File.open('naruto_2.html') do |file|
  file.write(RestClient.get(url))
end


