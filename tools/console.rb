# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

chine = Lifter.new("Chine", 5)
serven = Lifter.new("Serven", 6)
james = Lifter.new("James", 37)
ariel = Lifter.new("Ariel", 5)
kyle = Lifter.new("Kyle", 41)

wework = Gym.new("WeWork Gym")
pf = Gym.new("Planet Fitness")
ot = Gym.new("Orange Theory")

puts "Lifter tests"
puts "Given a gym and a membership cost, sign a specific lifter up for a new gym"
ariel.sign_up(0, wework)
serven.sign_up(0, wework)
james.sign_up(0, wework)
kyle.sign_up(0, wework)
chine.sign_up(0, wework)
serven.sign_up(20, ot)
kyle.sign_up(20, ot)
james.sign_up(20, ot)
kyle.sign_up(15, pf)
james.sign_up(15, pf)

puts "\n"
puts "String instead of cost:"
puts james.sign_up("uhjgkl", pf)
puts "\n"
puts "Fake gym:"
puts james.sign_up(15, "fghjkl")
puts "\n"

puts "String cost & fake gym:"
puts james.sign_up("hfsdjbk", "kjdfs")
puts "\n"

puts "Get a list of all lifters"
puts Lifter.all.inspect
puts "\n"

puts "Get a list of all the memberships that a specific lifter has"
puts ariel.list_membs == Membership.find_memb(ariel)
puts serven.list_membs == Membership.find_memb(serven)
puts james.list_membs == Membership.find_memb(james)
puts chine.list_membs == Membership.find_memb(chine)
puts kyle.list_membs == Membership.find_memb(kyle)
puts "\n"

puts "Get a list of all the gyms that a specific lifter has memberships to"
puts ariel.list_gyms == Membership.find_gyms(ariel)
puts serven.list_gyms == Membership.find_gyms(serven)
puts james.list_gyms == Membership.find_gyms(james)
puts chine.list_gyms == Membership.find_gyms(chine)
puts kyle.list_gyms == Membership.find_gyms(kyle)
puts "\n"


puts "Get the average lift total of all lifters"
puts Lifter.find_avg == 18.8
puts "\n"

puts "Get the total cost of a specific lifter's gym memberships"
puts ariel.get_cost == 0.0
puts serven.get_cost == 20.0
puts james.get_cost == 35.0
puts chine.get_cost == 0.0
puts kyle.get_cost == 35.0

puts "\n"

puts "Membership tests"
puts "Get a list of all memberships"
puts Membership.all.inspect
puts Membership.all.length == 10
puts "\n"


puts "Gym tests"
puts "Get a list of all gyms"
puts Gym.all == [wework, pf, ot]
puts "\n"

puts "Get a list of all memberships at a specific gym"
puts wework.gym_membs.inspect
puts wework.gym_membs.length == 5
puts pf.gym_membs.inspect
puts pf.gym_membs.length == 2
puts ot.gym_membs.inspect
puts ot.gym_membs.length == 3
puts "\n"

puts "Get a list of all the lifters that have a membership to a specific gym"
puts wework.gym_lifters.inspect
puts wework.gym_lifters.length == 5
puts pf.gym_lifters.inspect
puts pf.gym_lifters.length == 2
puts ot.gym_lifters.inspect
puts ot.gym_lifters.length == 3
puts "\n"

puts "Get a list of the names of all lifters that have a membership to that gym"
puts wework.gym_names.inspect
puts pf.gym_names.inspect
puts ot.gym_names.inspect
puts "\n"

puts "Get the combined lift total of every lifter has a membership to that gym"
total = ariel.lift_total + chine.lift_total + james.lift_total + kyle.lift_total + serven.lift_total
puts wework.combo_total == total
puts pf.combo_total == james.lift_total + kyle.lift_total
puts ot.combo_total == james.lift_total + kyle.lift_total + serven.lift_total

binding.pry

puts "Gains!"
