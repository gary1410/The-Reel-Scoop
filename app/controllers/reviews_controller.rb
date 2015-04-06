class ReviewsController < ApplicationController
	require 'segment/analytics'

	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new(movie_id: params[:movie_id])
	end

	def create
		@review = Review.new(review_params)
		Analytics.identify(
	    user_id: SecureRandom.uuid,
	    traits: {
	      email: params[:review][:email],
	      created_at: DateTime.now
	    })

		Analytics.track(
    user_id: SecureRandom.uuid,
    event: 'Movie Review',
    properties: {
      movie_id: params[:movie_id],
      email: params[:review][:email],
      comment: params[:review][:comment]
    })

		if @review.save
			flash[:success] = "You've reviewed #{@review.movie.title}, go review again!"
			redirect_to movies_path
		else
			render :new
		end
	end

	def show
	end

private
	
	def review_params
		params.require(:review).permit(:email, :rating, :comment, :movie_id)
	end
end
