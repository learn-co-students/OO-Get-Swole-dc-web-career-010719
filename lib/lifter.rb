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

  def lifter_memberships
    Membership.all.select { |membership| membership.lifter == self}
  end

  def lifters_gym
    self.lifters_gym.collect { |membership| membership.gym }
  end

  def self.avg_lift_total
    lift_array = self.all.collect { |lifter| lifter.lift_total}
    lift_total = lift_array.inject { |sum, n| sum + n}
    lift_total.to_f / lift_array.length
  end

  def membership_cost
    cost_array = self.lifter_memberships.collect { |membership| membership.cost}
    cost_array.inject {|sum, n| sum + n}
  end

  def membership_sign_up(cost, gym)
    Membership.new(cost, gym, self)
  end


end
