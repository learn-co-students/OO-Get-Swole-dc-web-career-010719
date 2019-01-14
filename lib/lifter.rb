class Lifter

  attr_reader :name, :lift_total, :memberships

@@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

def self.all
  @@all
end

def self.avg_lift_total
  totals = Lifter.all.map {|lifter| lifter.lift_total}
  totals.inject{|sum, el| sum + el }.to_f / totals.size
end


def memberships
  Membership.all.select {|membership|
     membership.lifter == self}
end

def gyms
self.memberships.map {|membership| membership.gym}
end

def total_cost
  costs= self.memberships.map{|membership| membership.cost}
  costs.inject {|x, y| x + y}
end

def sign_up (gym, membership_cost)
  Membership.new(membership_cost, self, gym)

end

end
