# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Category.delete_all

Product.create(id: 1, name: "Apple Iphone", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(id: 2, name: "Apple Macbook", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(id: 3, name: "Harry Potter", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
puts "PRODUCTS CREATED"

Category.create(name: "Category1")
Category.create(name: "Category2")
Category.create(name: "Category3")
Category.create(name: "Category4")
Category.create(name: "Category5")
puts "CATEGORIES CREATED"