require "rails_helper"

describe Product do
  let(:user) { User.create(email: Faker::Internet.email, password: "123456789", password_confirmation: "123456789", confirmed_at: Date.today) }
  let(:category) { Category.create(name: "Books") }
  
  it "has category" do
    product  = Product.create(user: user, category: category, name: "Apple Iphone", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
    expect(product.category).to eq(category)
  end

  it "has creator" do
    product  = Product.create(user: user, category: category, name: "Apple Iphone", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
    expect(product.user).to eq(user)  
  end

  it "has correct name" do
    product  = Product.create(user: user, category: category, name: "Apple Iphone", price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))
    expect(product.name).to eq("Apple Iphone")    
  end

  it "has correct price" do
    product  = Product.create(user: user, category: category, name: "Apple Iphone", price: 12.89, description: Faker::Lorem.paragraph(2, false, 10))
    expect(product.price).to eq(12.89)    
  end

  it "has correct description" do
    product  = Product.create(user: user, category: category, name: "Apple Iphone", price: Faker::Commerce.price, description: "to jest opis")
    expect(product.description).to eq("to jest opis")
  end

  it "raise error when name not given" do
    creation = lambda { Product.create!(user: user, category: category, price: Faker::Commerce.price, description: Faker::Lorem.paragraph(2, false, 10))}
    expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "raise error when description not given" do
    creation = lambda { Product.create!(user: user, category: category, price: Faker::Commerce.price, name: "NAME")}
    expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "raise error when price not given" do
    creation = lambda { Product.create!(user: user, category: category,name: "NAME", description: Faker::Lorem.paragraph(2, false, 10))}
    expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
  end
end