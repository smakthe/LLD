class Vehicle
  attr_reader :name, :colour, :fuel_type, :top_speed
  attr_accessor :wheels, :max_passenger
  def initialize(name, colour, fuel_type, top_speed, wheels, max_passenger)
    @name = name
    @colour = colour
    @fuel_type = fuel_type
    @top_speed = top_speed
    @wheels = wheels
    @max_passenger = max_passenger
  end

  def details
    "This is a brand new #{@name} in #{@colour} colour, runs on #{@fuel_type}, has #{@wheels} wheels and a maximum capacity of #{@max_passenger} passengers with a top speed of #{@top_speed} kmph"
  end
end

class Bike<Vehicle
  def initialize(*args, brand)
    super(*args)
    @brand = brand
  end

  def details
    "This is a brand new #{@name} by #{@brand} in #{@colour} colour, runs on #{@fuel_type}, has #{@wheels} wheels and a maximum capacity of #{@max_passenger} passengers with a top speed of #{@top_speed} kmph"
  end
end

class Scooty<Vehicle
  def initialize(*args, brand)
    super(*args)
    @brand = brand
  end

  def details
    "This is a brand new #{@name} by #{@brand} in #{@colour} colour, runs on #{@fuel_type}, has #{@wheels} wheels and a maximum capacity of #{@max_passenger} passengers with a top speed of #{@top_speed} kmph"
  end
end

class Auto<Vehicle
  def initialize(*args)
    super(*args)
  end
end

class Toto<Vehicle
  def initialize(*args)
    super(*args)
  end
end

class Car<Vehicle
  def initialize(*args, brand, make)
    super(*args)
    @brand = brand
    @make = make
  end

  def details
    "This is #{@name} by #{@brand}, a brand new #{@make} in #{@colour} colour, runs on #{@fuel_type}, has #{@wheels} wheels and a maximum capacity of #{@max_passenger} passengers with a top speed of #{@top_speed} kmph"
  end
end

class Bus<Vehicle
  def initialize(*args, axles, corporation)
    super(*args)
    @axles = axles
    @corporation = corporation
  end

  def details
    "This is a brand new #{@name} by #{@corporation} in #{@colour} colour, runs on #{@fuel_type}, has #{@wheels} wheels, #{@axles} and a maximum capacity of #{@max_passenger} passengers with a top speed of #{@top_speed} kmph"
  end
end