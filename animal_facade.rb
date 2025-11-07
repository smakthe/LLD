class Animal
    attr_reader :name, :colour, :breed, :legs, :sound, :food
  
    def initialize(name:, colour:, breed:, legs:, sound:, food:)
      @name = name
      @colour = colour
      @breed = breed
      @legs = legs
      @sound = sound
      @food = food
    end
  
    def info
      "#{@name} is a #{@colour} #{@breed} #{self.class.to_s.downcase} with #{@legs} legs who always #{@sound}s and loves to eat #{@food}"
    end
end
  
class Dog < Animal
    attr_reader :runs
  
    def initialize(runs:, **args)
      super(**args)
      @runs = runs
    end
  
    def is_running?
      @runs ? "#{@name} is running!" : "#{@name} is not running!"
    end
end
  
class Cat < Animal
    attr_reader :purrs
  
    def initialize(purrs:, **args)
      super(**args)
      @purrs = purrs
    end
  
    def is_purring?
      @purrs ? "#{@name} is purring!" : "#{@name} is not purring!"
    end
end
  
class AnimalBuilder
    def initialize
      @name = ""
      @colour = ""
      @breed = ""
      @legs = 4
      @sound = ""
      @food = ""
      @runs = false
      @purrs = false
    end
  
    def set_name(name)
      @name = name
      self
    end
  
    def set_colour(colour)
      @colour = colour
      self
    end
  
    def set_breed(breed)
      @breed = breed
      self
    end
  
    def set_sound(sound)
      @sound = sound
      self
    end
  
    def set_food(food)
      @food = food
      self
    end
  
    def set_runs(runs)
      @runs = runs
      self
    end
  
    def set_purrs(purrs)
      @purrs = purrs
      self
    end
  
    def build_cat
      Cat.new(purrs: @purrs, name: @name, colour: @colour, breed: @breed, legs: @legs, sound: @sound, food: @food)
    end
  
    def build_dog
      Dog.new(runs: @runs, name: @name, colour: @colour, breed: @breed, legs: @legs, sound: @sound, food: @food)
    end
end
  
class ZooFacade
    def initialize
      @builder = AnimalBuilder.new
    end
  
    def create_cat(name:, colour:, breed:, sound:, food:, purrs:)
      @builder.set_name(name)
              .set_colour(colour)
              .set_breed(breed)
              .set_sound(sound)
              .set_food(food)
              .set_purrs(purrs)
              .build_cat
    end
  
    def create_dog(name:, colour:, breed:, sound:, food:, runs:)
      @builder.set_name(name)
              .set_colour(colour)
              .set_breed(breed)
              .set_sound(sound)
              .set_food(food)
              .set_runs(runs)
              .build_dog
    end
end

zoo = ZooFacade.new
  
mashu = zoo.create_cat(
    name: "Mashu",
    colour: "grey",
    breed: "persian",
    sound: "meow",
    food: "fish",
    purrs: true
)
  
lucifer = zoo.create_dog(
    name: "Lucifer",
    colour: "white",
    breed: "pomeranian",
    sound: "bark",
    food: "chicken",
    runs: false
)
  
puts mashu.info
puts lucifer.info
puts mashu.is_purring?
puts lucifer.is_running?