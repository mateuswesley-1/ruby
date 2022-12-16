require 'pry-byebug'


def divide(number, divisor)
  begin
    binding.pry
    answer = number / divisor
    rescue ZeroDivisionError => e
      puts e.message
  end

end

puts divide(1,0)
