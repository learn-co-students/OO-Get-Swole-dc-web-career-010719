class Gym
  attr_reader :name, :membership, :lifters
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
  	@@all
  end

  def gym_memberships
    Membership.all.select do |mem|
      mem.gym == self
    end
  end

  def gym_members
    gym_memberships.collect do |mem|
    	mem.lifter
    end
  end

  def gym_membs_names
    gym_members.collect do |memb|
    	memb.name
    end
  end

  def gym_lifts
  	gym_members.collect do |memb|
      memb.lift_total
    end.inject(0) do |sum, lift_total|
    	sum + lift_total
    end
  end

end
