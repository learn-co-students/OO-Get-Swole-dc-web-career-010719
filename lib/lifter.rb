class Lifter
  attr_reader :name, :lift_total, :membership
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_memberships(lifter)
    Membership.all.select do |mem|
      mem.lifter.name == lifter
    end
  end

  def self.get_gyms(lifter_name)
  	Lifter.get_memberships(lifter_name).collect do |mem|
  		mem.gym
    end
  end

  def self.lift_avg
    total = self.all.collect do |lifter|
    	lifter.lift_total
    end.inject(0) do |sum, lift_total|
    	sum + lift_total
    end
    total / self.all.count
  end

  def get_mem_fees
    Lifter.get_memberships(self.name).collect do |mem|
    	mem.cost
    end.inject(0) do |sum, cost|
    	sum + cost
    end
  end

  def new_membership(gym, cost)
    Membership.new(cost, self, gym)
  end


end
