class ReviewsController < ApplicationController
  def new
    @baby = Baby.find(params[:baby_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `baby_id` to asssociate review with corresponding baby
    @review.baby = Baby.find(params[:baby_id])
    if @review.save
      redirect_to baby_path(@baby.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


