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
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    self.memberships.collect do |membership|
      membership.lifter
    end
  end

  def names
    self.lifters.collect do |member|
      member.name
    end
  end

  def lift_total
    total = 0
    self.lifters.each do |member|
      total += member.lift_total
    end
    total
  end
end
