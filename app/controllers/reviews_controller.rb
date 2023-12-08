class ReviewsController < ApplicationController
before_action :set_snack, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.snack = @snack
    @review.user = current_user
    if @review.save
      redirect_to snack_path(@snack)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_snack
    @snack = Snack.find(params[:snack_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
