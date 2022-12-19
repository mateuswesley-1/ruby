class MyCar
  attr_accessor :color
  attr_reader :year, :model
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @velocity = 0
    @on = false
  end

  def change_speed(delta_v)
    @velocity += delta_v
  end

  def brake(delta_v)
    @velocity -= delta_v
  end

  def velocidade_atual
    puts "Velocidade atual: #{@velocity} km/h"
  end

  def shut_off_on
    @on = !@on
    @velocity = 0
  end

end
