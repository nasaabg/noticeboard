class WelcomeController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).first(6)
    @categories = Category.order(:name)
  end
end
