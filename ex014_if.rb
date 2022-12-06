ano = Time.now.year

if (ano%4 == 0) && (ano%100 == 0) && (ano%400==0)
  dias_ano = 366
else
  dias_ano = 365
end


