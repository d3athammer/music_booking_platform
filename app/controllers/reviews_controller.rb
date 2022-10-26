class ReviewsController < ApplicationController
  before_action :set_studio, only: %i[new create]
  def new
    @review = Review.new
    authorize(@studio)
    authorize(@review)
    @studio = Studio.find(params[:studio_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.studio = @studio
    if @review.save
      redirect_to_studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to studio_path(@review.studio), status: :see_other
  end

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
