# Object Pattern Match

# we use he === opperator
# who check if the object on the right
# is in the set described by the object
# on the left

# 'A' === 'A' => true
# String === 'A' => true


# Para cada in do case, fazemos a operacao String === 'Input'
input = 3

case input
  in String then puts 'Input was of type String'
  in Integer then puts 'Input was of type Integer'
end


# Variable patters

age = [15]

# a recebe o valor de age pq
#temos uma varivel indicada
case *age
  in a
    puts a
end

# aways binds the value to the variable
a = 'vsf'

case 1
  # there is no comparation between the a = 'vsf' and 1,
  # just a matching pattern
  in a
  puts a #=> 1
end

# pin operator
a = 5

case 1
in ^a #match agains the value of the variable 'a'
    :no_match
end


# Alternative Patern Match
# in a|b|c


# guard conditions

# we can use guard conditions to make sure the pattern is only
# matched if the guard condition holds true

















# array pattern match


# array pattern + object patter
arr = [1 ,2]

case arr
in [a, b] then puts :match
in [3, 4] then puts :no_match
end


arr = *1..10

case arr
in [Integer, Integer, *, 9, 10]
   puts :match
end


# array pattern + object pattern + variable pattern

case arr
  in [Integer, Integer, *tail]
    p tail
end

# array pattern + object pattern + variable pattern + guard clause

case arr
  in [a, b, *, Integer, Integer] unless a == b
  puts :match
end


# array pattern + object pattern + variable pattern + guard clause + as pattern
arr = *1..10
arr << [1, 2]

case arr
  in [a, b, *, Integer, Integer, [c, d] => arr2]
  puts a,b,c,d
  p arr2
end


case arr
  in a, b, *, Integer, Integer, [c, d] => arr2
  puts a,b,c,d
  p arr2
end














# hash matching
hash = { a: 'apple', b: 'banana' }
case hash
  in a: apple
  puts apple
end


# the variables are created with the name of the symbol
case { a: 'apple', b: 'banana' }
  in { a:, b: }
    puts a
    puts b
  end

case { a: 'ant', b: 'ball', c: 'cat' }
in  a: , **rest
  p rest
end

case {a: 'ant', b: 'ball'}
in {a:, **nil}
  puts :nomath
in {:a}
  puts a
end

#as pattern and hash match
case {a: 'ant', b: 'ball'}
in {a: 'ant', b: ball} => hash
end








#rightward assigment

login = { username: 'mateus', password: 'bbb23vaisertop' }

login => {username: username}


# find pattern
# we seach for the pattern and save the rest
case [1, 2, 3]
  in [*pre, Integer, Integer, *post]
    p pre
    p post
  end

  # we search for the pattern ....string,integer...
  # once we find, anything before is pre and after is post
  case [1, 2, "a", 4, "b", "c", 7, 8, 9]
    in [*pre, String => x, Integer => i, *post]
      p pre
      p x
      p z
      p post
    end









