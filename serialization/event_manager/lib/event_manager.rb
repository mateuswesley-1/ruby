require 'csv'
puts 'Event Manager Initialized!'

=begin
if File.exist? "event_attendees.csv"
  contents_array = Array.new
  File.open "event_attendees.csv", 'r' do |file|
    until file.eof?
      contents_array << file.readline
    end
  end

else
  print 'File dont exist!'

end

contents_array.each_with_index do |line, i|
  next if i==0
  array_client = line.split(',')
  name = array_client[2]
  zip = array_client[9]
  puts ''
  puts "#{name} #{zip}"
=end

def clean_zip(zip)
  zip.to_s.rjust(5, '0')[0..4]
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol)

contents.each do |row|
  name = row[:first_name]

  zip = clean_zip(row[:zipcode])


  puts "#{name}, #{zip}"
end

