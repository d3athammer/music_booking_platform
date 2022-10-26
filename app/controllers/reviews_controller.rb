class ReviewsController < ApplicationController
  before_action :set_studio, only: %i[new create]
  def new
<<<<<<< HEAD
    @review = Review.new
    authorize(@studio)
    authorize(@review)
=======
    @studio = Studio.find(params[:studio_id])
    @review = Review.new
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
  end

  def create
    @review = Review.new(review_params)
<<<<<<< HEAD
    authorize @review
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @review.studio = @studio
    if @review.save
      redirect_to_studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
<<<<<<< HEAD
    authorize @review
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
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
