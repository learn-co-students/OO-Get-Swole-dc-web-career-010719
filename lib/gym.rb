require 'pry'

class Gym

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def gym_memberships
    Membership.all.select { |membership| membership.gym == self}
  end

  def lifters_at_gym
    self.gym_memberships.collect { |membership| membership.lifter }
  end

  def lifters_names_at_gym
    self.lifters_at_gym.collect { |lifter| lifter.name}
  end

  def total_lift_cost
    lift_total = self.gym_memberships.collect { |lifter| lifter.cost}
    lift_total.inject { |sum, n| sum + n}
  end




end
