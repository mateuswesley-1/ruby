require_relative 'basic_serializable.rb'

class Person
  include BasicSerializable

  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

eu = Person.new 'Mateus', 55, 'nb'
p eu.serialize
2
