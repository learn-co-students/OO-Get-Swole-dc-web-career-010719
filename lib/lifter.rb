class Lifter
  attr_reader :name, :lift_total

  @@all = []
  @@lift_total = 0

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
    @memberships = []
    @gyms = []
    @@lift_total += lift_total
    @total_cost = 0
  end

  def self.all
    @@all
  end

  def self.lift_total
    @@lift_total
  end

  def self.average_lift_total
    (@@lift_total.to_f / @@all.length).round(2)
  end

  def gyms
    @gyms
  end

  def memberships
    @memberships
  end

  def lifter_sign_up(gym, membership_cost)
    membership = Membership.new(membership_cost)
    self.memberships << membership
    self.gyms << gym
    gym.memberships << membership
    gym.lifters << self
    @total_cost += membership_cost
  end

end
