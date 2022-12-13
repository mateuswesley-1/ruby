julia = {  cadeira: "gamer confortavel",
  mesa: "4 cadeira",
  tv: "50 polegadas",
  cama: "king size"
}

julia_namorado = {  cadeira: "de plastico",
  video_game: "ps5",
  computador: "gamer da dell",
  pet: "2 gatos",
  cama: "solteiro"
}

# se tiver valores iguais, serao mantidos o do argumento, julia nesse caso

# quando usamos o {} depois do merge, as vari[aveis ter'ao a ordem da operacao, primiero o objeto, depois o argumento.
casamento = julia_namorado.merge(julia) {|key, moveis_namorado, moveis_julia| "#{moveis_namorado} e #{moveis_julia}"}

casamento.each do |key, value|
  puts "#{key}: #{value}"
end

puts casamento
