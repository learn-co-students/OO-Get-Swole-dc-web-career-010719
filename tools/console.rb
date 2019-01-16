# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test data goes here
barry = Lifter.new("Barry", 30)
oliver = Lifter.new("Ollie", 90)
bruce = Lifter.new("Mr. Wayne", 150)

golds = Gym.new("Golds")
plan_fit = Gym.new("Planet Fitness")
org_the = Gym.new("Orange Theory")
sol_core = Gym.new("Solid Core")
all_day = Gym.new("24 Hour Fitness")

Membership.new(50, barry, golds)
Membership.new(10, barry, plan_fit)
Membership.new(50, oliver, golds)
Membership.new(270, oliver, org_the)
Membership.new(90, bruce, sol_core)
Membership.new(300, bruce, all_day)
Membership.new(10, bruce, golds)




#test code goes here
puts Lifter.all.count == 3
puts Lifter.get_gyms("Mr. Wayne").count == 3
puts Lifter.lift_avg == 90
puts bruce.get_mem_fees == (90 + 300 + 10)

puts Membership.all.count == 7
puts Membership.all[0].lifter == barry
puts Lifter.get_memberships("Barry").count == 2

oliver.new_membership(sol_core, 70)
puts Membership.all.count == 8

puts Gym.all.count == 5
puts sol_core.gym_memberships.count == 2
puts sol_core.gym_members.include?(bruce)
puts sol_core.gym_membs_names.include?("Ollie")
puts golds.gym_lifts == 30 + 90 + 150


binding.pry

puts "Gains!"
