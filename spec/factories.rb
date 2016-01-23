FactoryGirl.define do  factory :point do
    value 1
  end
 
  
  factory :user do
    email Faker::Internet.free_email
    password "123456789"
    password_confirmation "123456789"
    confirmed_at Date.today
  end

  factory :product do
    name Faker::Commerce.product_name
    price Faker::Commerce.price 
    description Faker::Lorem.paragraph(2, false, 10)
  end
end