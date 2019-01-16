require 'pry'
require_relative '../lib/gym'
require_relative '../lib/lifter'
require_relative '../lib/membership'

anthony = Lifter.new("Anthony", 300)
ross = Lifter.new("Ross", 200)
chris = Lifter.new("Chris", 250)
equinox = Gym.new( "Equinox")
lifetime = Gym.new("Lifetime")
membership1 = Membership.new(100, equinox, anthony)
membership4 = Membership.new(90, lifetime, anthony)
membership2 = Membership.new(90, lifetime, ross)
membership3 = Membership.new(90, lifetime, chris)
membership5 = ross.membership_sign_up(100, equinox)
lifetime.gym_memberships
lifetime.lifters_at_gym
lifetime.total_lift_cost
Lifter.avg_lift_total
anthony.membership_cost



puts anthony.name == "Anthony"
puts ross.name == "Ross"
puts chris.name == "Chris"
puts equinox.name == "Equinox"
puts lifetime.name == "Lifetime"
puts membership1.cost == 100
puts membership2.cost == 90
puts membership3.cost == 90
puts lifetime.gym_memberships == [membership4, membership2, membership3]
puts lifetime.lifters_at_gym == [anthony, ross, chris]
puts lifetime.lifters_names_at_gym == ["Anthony", "Ross", "Chris"]
puts lifetime.total_lift_cost == 270
puts Lifter.avg_lift_total == 250
puts anthony.membership_cost == 190
puts ross.membership_sign_up(100, equinox) == membership5

binding.pry

0
