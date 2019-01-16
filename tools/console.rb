# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code, initialize some instances
globo = Gym.new("Globo-gym")
joes = Gym.new("Average Joe's")
swole = Lifter.new("White", 600)
swole2 = Lifter.new("Me'shell", 400)
weak = Lifter.new("Peter", 50)
weak2 = Lifter.new("Steve", 100)
globo_membership = Membership.new(globo, 50, swole)
globo2_membership = Membership.new(globo, 50, swole2)
joes_membership = Membership.new(joes, 10, weak)
puts globo.name == "Globo-gym"
puts globo_membership.cost == 50
puts globo_membership.member == swole

#gym tests
puts Gym.all == [globo, joes]
puts globo.memberships == [globo_membership, globo2_membership]
puts Gym.lifters(globo) == [swole, swole2]
puts globo.lifters_at_this_gym == [swole, swole2]
puts globo.total_weight == 1000

#lifter test
puts Lifter.all == [swole, swole2, weak, weak2]
puts swole.memberships == [globo_membership]
puts swole.gyms_belong_to == [globo]
puts Lifter.average_lift_total == 287.5
puts swole.membership_costs == 50
joes2_membership = weak2.join_gym(joes, 10)

#membership tests
puts Membership.all.count == 4
puts Membership.all == [globo_membership, globo2_membership, joes_membership, joes2_membership]



binding.pry

puts "Gains!"
