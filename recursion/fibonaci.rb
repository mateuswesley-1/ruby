class Fibonacci
  attr_reader :array_numbers

  def initialize(n)
    @n = n
    @array_numbers = [0, 1]
  end

  def using_loop
    for i in 1...(@n-1)
      @array_numbers << (@array_numbers[-1] + @array_numbers[-2])
    end
    @array_numbers
  end

  def using_recursion
    return @n if (@n <= 1)
    @n -= 1
    @array_numbers.push(using_recursion)
    @n -= 1
    @array_numbers[-1] += using_recursion
  end

end

p Fibonacci.new(10).using_loop
p Fibonacci.new(10).using_recursion
