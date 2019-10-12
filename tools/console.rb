# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'
require 'pry'

# test code goes here

shannon = Lifter.new("Shannon", 173)
artem = Lifter.new("Artem", 100)
ryan = Lifter.new("Ryan", 63)
matt = Lifter.new("Matt", 99)
ben = Lifter.new("Ben", 100)
phil = Lifter.new("Phil", 127)
table6 = Gym.new("Table 6 Gym")
mod1 = Gym.new("Mod 1 Gym")

puts Lifter.average_lift_total == 110.33

shannon.sign_up(table6, 1000)
artem.sign_up(table6, 1000)
shannon.sign_up(mod1, 175.50)
puts shannon.all_memberships.size == 2
puts shannon.all_gyms.size == 2
puts shannon.total_cost == 1175.5
puts table6.all_memberships.size == 2
puts table6.all_lifters.size == 2
phil.sign_up("Boston Gym", 199.99)
phil.sign_up("Table 6 Gym", 1000)
ryan.sign_up("Table 6 Gym", 1000)
matt.sign_up("Table 6 Gym", 1000)
ben.sign_up("Table 6 Gym", 1000)
puts table6.all_memberships.size == 6
puts table6.all_lifters.size == 6
puts Gym.all.size == 3

# binding.pry

puts "Table 6 rules"
