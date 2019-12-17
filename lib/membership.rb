class Membership
  attr_reader :cost, :lifter, :gym
  @@all = []
  def initialize(cost, lifter, gym)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_memb(lifter)
    self.all.select {|mem| mem.lifter == lifter}
  end

  def self.find_gyms(lifter)
    self.find_memb(lifter).collect {|mem| mem.gym}
  end
end
