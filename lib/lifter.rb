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

  def all_memberships
    Membership.all.select { |ms| ms.lifter == self }
  end

  def all_gyms
    self.all_memberships.map { |ms| ms.gym }
  end

  def self.calculate_lift_total(lifters)
    total = lifters.map { |lifter| lifter.lift_total.to_f }.inject(:+)
    (total/lifters.size).round(2)
  end

  def self.average_lift_total
    self.calculate_lift_total(self.all)
  end

  def total_cost
    self.all_memberships.map { |ms| ms.cost }.inject(:+)
  end

  def sign_up(gym_name, cost)
    if Gym.find_gym(gym_name).nil?
      gym = Gym.new(gym_name)
    else
      gym = Gym.find_gym(gym_name)
    end
    Membership.new(cost, gym, self)
  end

end
