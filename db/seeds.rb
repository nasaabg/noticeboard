# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Category.delete_all

book = Category.create(name: "Books")
car = Category.create(name: "Cars")
ele = Category.create(name: "Electronics")
fasion = Category.create(name: "Fasion")
toys = Category.create(name: "Toys & Hobbies")
sport = Category.create(name: "Sport")
art = Category.create(name: "Collectibles & Art")
ent = Category.create(name: "Entertainment")
home = Category.create(name: "Home & Garden")
puts "CATEGORIES CREATED"

Product.create(category: ele,name: "Apple Iphone", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: ele,name: "Apple Macbook", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: book,name: "Harry Potter", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: fasion,name: "T-Shirt", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: toys,name: "Lego Army", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: sport,name: "Nike Vapor", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: art,name: "Kossak", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: ent,name: "Justin Bieber", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: home,name: "Modern Lamp", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: car,name: "Porshe", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: car,name: "Volvo", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
Product.create(category: car,name: "Skoda", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
puts "PRODUCTS CREATED"