class ReviewsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # this will look for the id of the restaurant
    @review.restaurant = @restaurant
    if @review.save
      # redirect to the show page ( see in rails routes the path)
      redirect_to restaurant_path(@restaurant)
    else # display the review new form html and it will display the error to the user
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
