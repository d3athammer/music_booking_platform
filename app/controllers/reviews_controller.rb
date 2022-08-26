class ReviewsController < ApplicationController
  before_action :set_studio
  def new
    @review = Review.new
  end

  def create

  end

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

end
