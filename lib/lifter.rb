class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total.to_f
    @@all << self
  end

  def self.all
    @@all
  end

  def list_membs
    Membership.all.select {|mem| mem.lifter == self}
  end

  def list_gyms
    list_membs.collect {|mem| mem.gym}
  end

  def self.find_avg
    total = 0.0
    self.all.each {|lifter| total += lifter.lift_total}
    divider = self.all.length.to_f
    average = (total / divider).round(2)
  end

  def sign_up(cost, gym)
    fcost = Float(cost) rescue nil
    if fcost != nil && Gym.all.include?(gym)
      Membership.new(fcost, self, gym)
    elsif fcost == nil && Gym.all.include?(gym)
       "Make sure the cost is a number."
    elsif !Gym.all.include?(gym) && fcost != nil
       "That's not a real gym. Try again."
    else
       "Cost is not a number and gym is not a real gym. Try again."
    end
  end

  def get_cost
    cost = 0.0
    list_membs.each {|mem| cost += mem.cost }
    cost.round(2)
  end
end
