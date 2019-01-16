class Lifter

  attr_accessor :gyms
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @gyms = []

    @@all << self
  end

  def self.all
    @@all
  end

  def join_gym(gym_object, cost)
    gym_object.members << self
    self.gyms << gym_object
    Membership.new(gym_object, cost, self)
  end

  def memberships
    Membership.all.select{|mem| mem.lifter == self}
  end

  def self.average_lift
    self.all.map{|lifter| lifter.lift_total}.inject{|total, lift_amount| total + lift_amount}.to_f / self.all.size
  end

  def lifter_total_membership_cost
    Membership.all.select{|mem| mem.lifter == self}.map{|mem| mem.cost }.inject{|total, cost| total + cost}
  end

end






#
