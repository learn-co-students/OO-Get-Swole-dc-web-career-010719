class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def all_memberships
    Membership.all.select { |ms| ms.gym == self }
  end

  def all_lifters
    self.all_memberships.map { |ms| ms.lifter }
  end

  def lifters_names
    self.all_lifters.map { |lifter| lifter.name }
  end

  def combined_lift_total
    Lifter.calculate_lift_total(self.all_lifters)
  end

  def self.find_gym(gym_name)
    if gym_name.class == Gym
      return gym_name
    else
      self.all.find { |gym| gym.name == gym_name }
    end
  end

end
