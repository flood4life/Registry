class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy, :approve]
  before_action :set_product, except: [:pending, :approve]
  authorize_resource 

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    if user_signed_in?
      @review.user = current_user
    else
      @review.is_pending = true
    end

    @product.reviews << @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to catalog_product_path(@product.catalog, @product), flash: {is_pending: !@review.user.present?} }
      else
        format.html { render 'products/show' }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to catalog_product_path(@product.catalog, @product), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

    @review.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  def approve
    @review.is_pending = false
    @review.save
    redirect_to :back
  end

  def pending
    @reviews = Review.pending
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.friendly.find params[:product_id]
    end

    def review_params
      params.require(:review).permit(:message, :guest_name)
    end
end
