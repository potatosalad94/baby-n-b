class ReviewsController < ApplicationController
  def new
    @baby = Baby.find(params[:baby_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @baby = Baby.find(params[:baby_id])
    @review.baby = Baby.find(params[:baby_id])
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :baby_id)
  end
end

# pb1: le bouton submit télécharge un fichier
# pb2 : la review n'est pas save
