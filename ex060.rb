a_proc = Proc.new {|val| puts val}


array = *1..10
array.each |val| a_proc.call
