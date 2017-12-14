require "pry"

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species, name=nil)
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
    self

    #binding.pry

  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].each { |good_dog| good_dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each { |good_cat| good_cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each { |good_fish| good_fish.mood = "happy"}
  end

  def sell_pets
    all_good_pets = @pets.values.flatten
    all_good_pets.each { |good_pet| good_pet.mood = "nervous" }
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
    #binding.pry
  end

end
