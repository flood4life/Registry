class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @catalog = @product.catalog
    @review = Review.new
  end
end
