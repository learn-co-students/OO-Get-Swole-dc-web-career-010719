class Membership

  attr_accessor :gym, :lifter
  attr_reader :cost

  @@all = []

  def initialize(gym, cost, lifter)
    @gym = gym
    @cost = cost
    @lifter = lifter

    @@all << self
  end

  def self.all
    @@all
  end
end




# Get a list of all memberships
