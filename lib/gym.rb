class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def gym_membs
    Membership.all.select {|mem| mem.gym == self}
  end

  def gym_lifters
    gym_membs.collect {|mem| mem.lifter}
  end

  def gym_names
    gym_membs.collect {|mem| mem.lifter.name}
  end

  def combo_total
    total = 0
    gym_lifters.each {|lifter| total += lifter.lift_total}
    total
  end
end
