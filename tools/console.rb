# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

#

james = Lifter.new("James", 1000)
david = Lifter.new("David", 800)
huw = Lifter.new("Huw", 900)
haley = Lifter.new("Haley", 400)
mollie = Lifter.new("Mollie", 300)

golds = Gym.new("Golds Gym")
et = Gym.new("Earth Treks")
asc = Gym.new("Arlington Sports Club")
ymca = Gym.new("YMCA")


james.sign_up(et, 95)
david.sign_up(et, 95)
haley.sign_up(et, 95)
huw.sign_up(ymca, 50)
huw.sign_up(et, 95)
mollie.sign_up(golds, 70)
james.sign_up(golds, 70)
david.sign_up(asc, 15)

binding.pry

puts "Gains!"
