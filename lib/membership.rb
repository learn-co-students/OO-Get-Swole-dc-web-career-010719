class Membership
  attr_reader :cost, :gym, :lifter
  @@all = []

  def initialize(cost, gym, lifter)
    @cost, @gym, @lifter = cost, gym, lifter
    @@all << self
  end

  def self.all
    @@all
  end

end
