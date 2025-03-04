# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "Admin User",
  email: "admin@example.com",
  photo_url: "https://www.loudegg.com/wp-content/uploads/2020/10/Mickey-Mouse.jpg",
  role: "admin",
  uid: "125"
)

puts "Admin user created successfully!"