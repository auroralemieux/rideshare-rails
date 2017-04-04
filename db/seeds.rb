require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# passengers_array = []
# CSV.read("support/passengers.csv", headers: true).map do |line|
#   passenger = {name: line[1], phone: line[2]}
#   passengers_array << passenger
# end
#
# passengers_array.each do |passenger|
#   newp = Passenger.create(passenger)
#   if !newp.id
#     puts "couldn't create passenger #{passenger.name}"
#   end
# end

passengers_array = []
CSV.read("support/passengers.csv", headers: true).map do |line|
  passenger = {name: line[1], phone: line[2]}
  passengers_array << passenger
end

passengers_array.each do |passenger|
  newp = Passenger.create(passenger)
  if !newp.id
    puts "couldn't create passenger #{passenger.name}"
  end
end