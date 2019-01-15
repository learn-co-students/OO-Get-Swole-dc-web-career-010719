# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here
gym1 = Gym.new('Gold_Gym')
gym2 = Gym.new("Fitness_Gym")
lifter1 = Lifter.new("Hai", 20)
lifter2 = Lifter.new('Nathan', 30)
lifter3 = Lifter.new('Vince', 30)
lifter1.lifter_sign_up(gym1, 50)
lifter1.lifter_sign_up(gym2, 60)
lifter2.lifter_sign_up(gym1, 40)
lifter3.lifter_sign_up(gym2, 60)

binding.pry

puts "Gains!"
