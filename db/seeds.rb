require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

passengers_array = []
CSV.read("support/passengers.csv", headers: true).map do |line|
  passenger = {name: line[1], phone: line[2]}
  passengers_array << passenger
end

passengers_array.each do |passenger|
  newp = Passenger.create!(passenger)
  if !newp.id
    puts "couldn't create passenger #{passenger.name}"
  end
end

drivers_array = []
CSV.read("support/drivers.csv", headers: true).map do |line|
  driver = {name: line[1], vin: line[2]}
  drivers_array << driver
end

drivers_array.each do |driver|
  newd = Driver.create!(driver)
  if !newd.id
    puts "couldn't create driver #{driver.name}"
  end
end

trips_array = []
CSV.read("support/trips.csv", headers: true).map do |line|
  date = Time.parse(line[3])
  trip = { driver_id: line[1].to_i, passenger_id: line[2].to_i, date: date, rating: line[4].to_i, cost: rand(5.0..30.0).round(2) }
  trips_array << trip
end

trips_array.each do |trip|
  newt = Trip.create(trip)
  if !newt.driver_id
    puts "couldn't create trip driver #{newt.driver_id}'s trip"
  end
end
