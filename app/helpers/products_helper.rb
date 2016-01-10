module ProductsHelper
  def active?(category)
    @product.category == category ? "active" : ""
  end
end
