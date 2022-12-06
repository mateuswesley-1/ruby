#loop
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end

puts
puts

#while
i = 0
while i<10
  puts "i is #{i}"
  i+=1
end

puts
puts

#until
i = 0
until i>=10
  puts "i is #{i}"
  i+=1
end

puts
puts

#for
for i in 0...10
  puts "i is #{i}"
end

puts
puts

#times
i=0
10.times do
  puts "i is #{i}"
  i+=1
end

#times number
puts
puts
10.times do |number|
  puts "i is #{number}"
end
