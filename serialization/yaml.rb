require 'yaml'
require 'json'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_yaml
    YAML.dump ({
      :name => @name,
      :age => @age,
      :gender => @gender
    })
  end

  def to_json
    JSON.dump ({
      :name => @name,
      :age => @age,
      :gender => @gender
    })
  end

  def self.from_yaml(string)
    # pega os dados que sao importados como hash e
    # transforma no objeto da nossa classe
    data = YAML.load string
    p data
    self.new(data[:name], data[:age], data[:gender])
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['name'], data['age'], data['gender'])
  end
end

me = Person.new 'Mateus', 35, 'male'
me_json = me.to_json

me_again = Person.from_json(me_json)
p me_again
p me_json
