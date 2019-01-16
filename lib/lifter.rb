class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  # Get a list of all lifters
  def self.all
    @@all
  end

  # Get a list of all the memberships that a specific lifter has
  def memberships
    Membership.all.select {|membership| membership.member == self}
  end
  # # Get a list of all the gyms that a specific lifter has memberships to
  def gyms_belong_to
    memberships = Membership.all.select {|membership| membership.member == self}
    memberships.map {|membership| membership.gym}
  end
  # Get the average lift total of all lifters
  def self.average_lift_total
    total = Lifter.all.sum {|lifter| lifter.lift_total}
    total_lifters = Lifter.all.uniq.count
    average = total.to_f/total_lifters.to_f
  end

  # # Get the total cost of a specific lifter's gym memberships
  def membership_costs
      lifters_gyms = Membership.all.select {|membership| membership.member == self}
      lifters_gyms.sum {|membership| membership.cost}
  end

  # Given a gym and a membership cost, sign a specific lifter up for a new gym
  def join_gym(gym, cost)
    Membership.new(gym, cost, self)
  end
end
