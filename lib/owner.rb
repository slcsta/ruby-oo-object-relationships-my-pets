require "pry"
class Owner

  attr_accessor :pets, :dog, :cat
  attr_reader :name, :species 

  @@all = []
  #@@pets = {:dogs => [], :cats => []}

  def initialize(name = "Blank Space")
    @name = name
    @species = "human"
    # @pets = {:dog => [], :cat => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def pets
    @@pets
  end
  
  def cats
    cat = Cat.all.select do |cat| 
      cat.owner == self
    end
  end

  def dogs
    dog = Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs.map do |dog|
      dog.owner = nil 
      dog.mood = "nervous"
    end

    cats.map do |cat|
      cat.owner = nil
      cat.mood = "nervous" 
    end
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end



end
