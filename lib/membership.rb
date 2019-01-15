class Membership
  attr_reader :cost

  @@all = []

  def initialize(cost)
    @cost = cost
    @@all << self
  end

  def self.all
    @@all
  end

end
