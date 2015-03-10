class ProductsController < ApplicationController
  def show
    @product = Product.friendly.find(params[:id])
    @catalog = @product.catalog
    @review = Review.new
  end
end
