class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average
    sum = 0
    Lifter.all.each do |lifter|
      sum += lifter.lift_total
    end
    sum / Lifter.all.length
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def total_cost
    total = 0
    self.memberships.each do |memship|
      total += memship.cost
    end
    total
  end

  def gyms
    self.memberships.collect do |membership|
      membership.gym
    end
  end

  def sign_up(gym, cost)
    Membership.new(cost, self, gym)
  end
end
