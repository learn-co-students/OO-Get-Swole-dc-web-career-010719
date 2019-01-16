class Gym
  attr_reader :name, :members

  @@all = []

  def initialize(name)
    @name = name
    @members = []

    @@all << self
  end

  def self.all
    @@all
  end

  def memberships_by_gym
    Membership.all.select{|mem| mem.gym == self}
  end

  def lifters_by_gym
    self.memberships_by_gym.map{|mem| mem.lifter}
  end

  def lifter_names_by_gym
    self.lifters_by_gym.map{|lifter| lifter.name}
  end

  def collective_lift_total
    self.lifters_by_gym.map{|lifter| lifter.lift_total}.inject{|total, i| total + i}
  end

end
