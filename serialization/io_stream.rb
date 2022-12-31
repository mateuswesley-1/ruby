path = 'C:\Users\mateu\OneDrive\Área de Trabalho\Desenvolvimento Web\Odin\Ruby\ruby\serialization\texto.txt'



txt = IO.new(IO.sysopen path)

puts txt.gets
