class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@number_instances = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @velocity = 0
    @on = false
    @@number_instances += 1
  end

  def self.number_instances
    @@number_instances
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


  def spray_paint(color)
    self.color = color
    puts "Nova cor: #{color}"
  end

  def age
    "Your #{model} is #{idade} years old"
  end

  private
  def idade
    Time.now.year - year
  end


end

class MotorVehicles < Vehicle

  def initialize(year, color, model, fuel, flex=false, motor = 'combustion')
    super(year, color, model)
    @fuel = fuel
    @flex = flex
    @motor = motor
  end

  def shut_off_on
    @on = !@on
    @velocity = 0
  end

  def self.gas_mileage(gallons, miles)
    miles/gallons
  end

end

module Drifitable
  def drift(veiculo)
    "Estou fazendo drift com meu veiculo #{veiculo}"
  end

end

class MyCar < MotorVehicles
  include Drifitable
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color} #{model} #{year}"
  end
end

class MyTruck < MotorVehicles
  NUMBER_OF_DOORS = 2
  def initialize(year, color, model, fuel, flex=false, motor = 'combustion', number_wheels = 22)
    super(year, color, model, fuel, flex=false, motor = 'combustion')
    @number_wheels = number_wheels
  end

  def to_s
    "My Truck is a #{color} #{model} #{year}"
  end
end

caminhao = MyTruck.new(2011, 'preto', 'Yamaha', 'gasoline')

carro = MyCar.new(2015, 'vermelho', 'Honda', 'Gasoline')

puts carro
puts caminhao.age
