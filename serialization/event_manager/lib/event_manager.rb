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


template = ERB.new File.read('form_letter.erb')

def get_civic_info()
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  civic_info
end

def legislators_by_zipcode(zip)
  civic_info = get_civic_info

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody'].officials
    )

  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def clean_zip(zip)
  zip.to_s.rjust(5, '0')[0..4]
end

def save_thank_you_letter(id, form_letter)

  Dir.mkdir('output') unless Dir.exist? 'output'

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end
contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zip = clean_zip(row[:zipcode])
  legislators = legislators_by_zipcode(zip)

  form_letter = template.result(binding)

  save_thank_you_letter(id, form_letter)
end
