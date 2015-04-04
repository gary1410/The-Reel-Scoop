require 'rails_helper'

describe ReviewsController do

  describe '#create' do
  	before :each do
  		@movie = FactoryGirl.create(:movie)
  		@review_build = FactoryGirl.build(:review, movie: @movie)
  	end

  	it 'creates a review with valid attributes' do
  		expect{post :create, movie_id: @movie.id, review: @review_build.attributes}.to change(Review, :count).by(1)
		end

		it 'should not create a review with invalid attributes' do
			@review_build.email = nil
			expect{post :create, movie_id: @movie.id, review: @review_build.attributes}.to_not change(Review, :count)
		end
	end
end



# #new

# get :new, movie_id: @movie.id


# @review = FactoryGirl.build(:review)
# expect(post :create, review: @review.attributes).to change(Review, :count).by(1)


# with invalid params
# expect(post :create, review: @review.attributes).to_not change(Review, :count)