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

  def memberships
    Membership.all.select {|membership|
       membership.gym == self}
  end

  def lifters
    self.memberships.map {|membership| membership.lifter}
  end

  def lifters_names
    self.lifters.map{|lifter| lifter.name}
  end

  def total_weight
  totals = self.lifters.map {|lifter| lifter.lift_total}
  totals.inject{|x,y| x+y }
  end
end
