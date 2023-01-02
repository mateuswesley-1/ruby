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
require 'csv'
require 'erb'
require 'google/apis/civicinfo_v2'
require 'time'

template = ERB.new File.read('form_letter.erb')


def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials

  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def clean_zip(zip)
  zip.to_s.rjust(5, '0')[0..4]
end

def clean_phone(phone)
  phone = phone.to_s.scan(/\d+/).join
  if phone.length == 11 && phone.to_s[0] == '1'
    "(#{phone[1..3]}) #{phone[4..6]}-#{phone[7..]}"
  elsif phone.length == 10
    "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..]}"
  else
    'The number is invalid'
  end
end

def save_thank_you_letter(id, form_letter)

  Dir.mkdir('output') unless Dir.exist? 'output'

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def get_csv_data(arquive, headers, header_converters)
  CSV.open(
    arquive,
    headers: headers,
    header_converters: header_converters
  )
end

def create_time_to_object(time_string, time_format)
  Time.strptime(time_string, time_format)
end

# create a hash with the values of an array and
# their frequence
def counting_values(values_array)
  values_hash = Hash.new
  values_array.uniq.each do |value|
    values_hash[value] = values_array.count(value)
  end
  values_hash
end

# get the key with the hights value
def highest_value_hash(hash)
  hash.key(hash.values.max)
end

# getting csv content with the data from registred people
contents = get_csv_data('event_attendees.csv', true, :symbol)

# self explanatory
hour_array = []
day_array = []

contents.each do |row|
  # for each person get the data
  id = row[0]
  name = row[:first_name]
  zip = clean_zip(row[:zipcode])
  phone = clean_phone(row[:homephone])
  date = create_time_to_object(row[:regdate], '%m/%d/%Y %k:%M')
  hour_array << date.hour
  day_array << date.strftime('%A')

  puts "#{id} #{name} #{zip} #{phone} #{hour_array[-1]} #{day_array[-1]}"

  # use the data from csv to search for person in API
  legislators = legislators_by_zipcode(zip)

  form_letter = template.result(binding)

  # puts form_letter
  save_thank_you_letter(id, form_letter)
end

# Array with the hour of the day in the 24hrs format as keys and the frequencie as values
hour_freq = counting_values(hour_array)
day_freq = counting_values(day_array)

# getting best hour for ad publicity
best_hour = highest_value_hash hour_freq
puts "The time with the highest number of records is between #{best_hour}:00 and #{best_hour}:59"

# getting day with more registers
best_day = highest_value_hash day_freq
puts "The day with the highest number of records is #{best_day}"
