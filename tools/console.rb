# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

jerry = Lifter.new("Jerry", 100)
adam = Lifter.new("Adam", 200)
dick = Lifter.new("Richard", 130)
lori = Lifter.new("Lorilei", 250)

puts "lifter knows their name and lift total"
puts adam.name == "Adam"
puts lori.lift_total == 250

gold = Gym.new("Gold's Gym")
sh = Gym.new("Sport & Health")

puts "gym knows its name"
puts gold.name == "Gold's Gym"
puts sh.name == "Sport & Health"

jm = jerry.sign_up(gold, 50.00)
dm = dick.sign_up(sh, 69.99)
jm2 = jerry.sign_up(sh, 46.75)
am = adam.sign_up(gold, 56.55)
lm = lori.sign_up(gold, 47.50)

puts "lifter #sign_up creates a membership with the correct attributes"
puts Membership.all == [jm, dm, jm2, am, lm]
puts jm.gym == gold
puts dm.cost == 69.99
puts jm.lifter == jerry

puts "lifter knows about all of their memberships & gyms"
puts jerry.memberships == [jm, jm2]
puts jerry.gyms == [gold, sh]

puts "gym knows about all of its memberships & lifters"
puts sh.memberships == [dm, jm2]
puts gold.lifters == [jerry, adam, lori]

puts "lifter class knows the average of all of its lifters' lift amount"
puts Lifter.average == 170

puts "lifter knows the total cost of all of their memberships"
puts jerry.total_cost == 96.75

puts "gym knows the names of all of its members"
puts gold.names == ["Jerry", "Adam", "Lorilei"]

puts "gym knows the lift total of all of its members"
puts gold.lift_total == 550

# binding.pry

puts "Gains!"
