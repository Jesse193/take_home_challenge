# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
create_list(:customer, 5)
@tea_1 = create(:tea)
@tea_2 = create(:tea)
create(:subscription, tea_id: @tea_1.id)
create(:subscription, tea_id: @tea_2.id)
