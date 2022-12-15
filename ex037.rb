def common_sports(current_sports, favorite_sports)

  unless current_sports.is_a? Array
    raise "A variavel #{current_sports} nao e uma Array"
    return
  end

  unless favorite_sports.is_a? Array
    raise "A variavel #{favorite_sports} nao e uma Array"
    return
  end

  current_sports.intersection(favorite_sports)
end

p common_sports([1,2,3,5,1,10],[2,3,11,2,8])
