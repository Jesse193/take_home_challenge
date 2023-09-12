# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customer = Customer.create!(first_name: "Bill", last_name: "Smith", email: "email@email.com", address: "example street" )
@tea_1 = Tea.create!(title: "Green", description: "some description", temperature: 100, brew_time: 5)
@tea_2 = Tea.create!(title: "black", description: "a description", temperature: 110, brew_time: 4)
subscription = Subscription.create!(title: "green tea", price: 10.0, frequency: "monthly", tea_id: @tea_1.id)
subscription = Subscription.create!(title: "black tea", price: 10.0, frequency: "monthly", tea_id: @tea_2.id)
