class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @memberships = []
    @lifters = []
  end

  def self.all
    @@all
  end

  def memberships
    @memberships
  end

  def lifters
    @lifters
  end

  def all_lifter_names
    self.lifters.collect do |lifter|
      lifter.name
    end
  end

  def combined_lift_total
    combined_total = 0
    self.lifters.collect do |lifter|
      lifter.lift_total
    end.each do |lift_total|
      combined_total += lift_total
    end
    combined_total
  end

end
