class ProductsController < ApplicationController
  def show
    @catalog = Catalog.friendly.find(params[:catalog_id])
    @product = @catalog.products.friendly.find(params[:id])
    @review = Review.new
  end
end
