class Animal
  def initialize(**args)
    @name = args[:name]
    @colour = args[:colour]
    @breed = args[:breed]
    @legs = 4
    @sound = args[:sound]
    @food = args[:food]
  end
end

class Dog < Animal
  def initialize(runs, **args)
    super(**args)
    @runs = runs
  end
end

class Cat < Animal
  def initialize(purrs, **args)
    super(**args)
    @purrs = purrs
  end
end

mashu = Cat.new(true, name: "Mashu", colour: "grey", breed: "persian", sound: "meow", food: "fish")
lucifer = Dog.new(false, name: "Lucifer", breed: "pomeranian", colour: "white", food: "chicken", sound: "bark")

Animal.class_eval do
  def info
    "#{@name} is a #{@colour} #{@breed} #{self.class.to_s.downcase} with #{@legs} legs who always #{@sound}s and loves to eat #{@food}"
  end
end
puts mashu.info
puts lucifer.info

mashu.instance_eval do
  def is_purring?
    @purrs ? "Mashu is purring!" : "Mashu is not purring!"
  end
end
lucifer.instance_eval do
  def is_running?
    @runs ? "Lucifer is running!" : "Lucifer is not running!"
  end
end
puts mashu.is_purring?
puts lucifer.is_running?

