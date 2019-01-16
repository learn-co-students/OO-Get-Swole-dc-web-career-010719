class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # Get a list of all gyms
  def self.all
    @@all
  end
  # Get a list of all memberships at a specific gym
  def memberships
    Membership.all.select {|membership| membership.gym == self}
  end
  # Get a list of all the lifters that have a membership to a specific gym
  def self.lifters(gym)
    memberships_for_gym = Membership.all.select {|membership| membership.gym == gym}
    lifters = memberships_for_gym.map {|membership| membership.member}
  end
  # # Get a list of the names of all lifters that have a membership to that gym
  def lifters_at_this_gym
    memberships_here = Membership.all.select {|membership| membership.gym == self}
    memberships_here.map {|membership| membership.member}
  end
  # # Get the combined lift total of every lifter has a membership to that gym
  def total_weight
    lifters_here = Membership.all.select {|membership| membership.gym == self}
    lifters_here.sum {|lifter| lifter.member.lift_total}
  end
end
