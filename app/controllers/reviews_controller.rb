class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      flash[:success] = "Successfully reviewed!"
    else
      flash[:danger] = "Review not successful."
    end
    redirect_to request.referrer
  end

  private
  def review_params
    params.require(:review).permit(:reservation_id, :room_id, :rating, :comment)
  end
end
