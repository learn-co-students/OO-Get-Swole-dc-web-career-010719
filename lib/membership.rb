class Membership
  attr_reader :cost, :gym, :member
  @@all = []

  def initialize(gym, cost, member)
    @gym = gym
    @cost = cost
    @member = member
    @@all << self
  end

  def self.all
    @@all
  end
end
