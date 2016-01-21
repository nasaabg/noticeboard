require "rails_helper"

describe Category do
  it "has correct name" do
    category = Category.create!(name: "Books")
    expect(category.name).to eq("Books")
  end

  it "has products" do
    products = create_list(:product, 3)
    category = Category.create!(name: "Books", products: products)
    expect(category.products).to eq(products)
  end

  it "returns of products" do
    products = create_list(:product, 3)
    category = Category.create!(name: "Books", products: products)
    expect(category.products).to eq(products)
  end

  it "has products" do
    products = create_list(:product, 3)
    category = Category.create!(name: "Books", products: products)
    expect(category.products).to be_an ActiveRecord::Associations::CollectionProxy
  end

  it "raise error when name not given" do
    creation = lambda { Category.create! }
    expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
  end

end