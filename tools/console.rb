# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

phil = Lifter.new("Phil", 250)
bob = Lifter.new("Bob", 200)
john = Lifter.new("John", 100)

gym_one = Gym.new("Gym One")
gym_two = Gym.new("Gym Two")
gym_three = Gym.new("Gym Three")

puts Lifter.all.include?(phil)
puts Lifter.all.size == 3

puts Gym.all.include?(gym_one)
puts Gym.all.size == 3

puts "--- lifter "

phil.join_gym(gym_one, 100)
phil.join_gym(gym_two, 150)
bob.join_gym(gym_one, 100)
john.join_gym(gym_three, 50)
john.join_gym(gym_two, 50)

puts phil.gyms.size == 2
puts john.gyms.size == 1

puts phil.memberships.size == 2
puts bob.memberships.size == 1

puts Lifter.average_lift

puts phil.lifter_total_membership_cost
puts john.lifter_total_membership_cost

puts " ---- membership"

puts Membership.all.size == 5

puts " --- gym"

puts gym_one.memberships_by_gym.size == 2
puts gym_three.memberships_by_gym.size == 1

puts gym_one.lifters_by_gym.size == 2
puts gym_three.lifters_by_gym.include?(john)

puts gym_one.lifter_names_by_gym

puts gym_one.collective_lift_total
puts gym_two.collective_lift_total




# binding.pry

puts "Gains!"

# Lifter
# Get a list of all the memberships that a specific lifter has
# Get the average lift total of all lifters
# Get the total cost of a specific lifter's gym memberships
# Given a gym and a membership cost, sign a specific lifter up for a new gym
#
# Membership
# Get a list of all memberships
#
# Gym
# Get a list of all memberships at a specific gym
# Get a list of all the lifters that have a membership to a specific gym
# Get a list of the names of all lifters that have a membership to that gym
# Get the combined lift total of every lifter has a membership to that gym
