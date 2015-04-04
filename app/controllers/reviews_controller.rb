class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new(movie_id: params[:movie_id])
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			flash[:success] = "You've reviewed #{@review.movie.title}, go review again!"
			redirect_to movies_path
		else
			render :new
		end
	end

private
	
	def review_params
		params.require(:review).permit(:email, :rating, :comment, :movie_id)
	end
end
